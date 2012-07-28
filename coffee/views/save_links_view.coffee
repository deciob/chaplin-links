define [
  'chaplin'
  'syphon'
  'views/base/view'
  'models/link'
  'text!templates/save_links.hbs'
], (Chaplin, Syphon, View, Link, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class SaveLinksView extends View

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    className: 'sidebar'

    # Automatically append to the DOM on render
    container: '#links-section'
    # Automatically render after initialize
    autoRender: true

    initialize: ->
      super
      @delegate 'submit', 'form', @saveLink
      @modelBind 'add', @linkAdded

    saveLink: (e) ->
      e.preventDefault()
      data = Syphon.serialize @
      tag_list = data.tags.replace(/^\s+|\s+$/g, "").split ","
      link = new Link( name: data.name, url: data.url, tags: tag_list )
      mediator.publish 'tags:add', tag_list
      @collection.add(link)
      link.save()

    linkAdded: (item, collection, options = {}) ->
      $('form').find('input:text').val('')

      