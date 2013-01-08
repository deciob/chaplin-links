define [
  #'jquery'
  'tooltip'
  'chaplin'
  'syphon'
  'views/base/view'
  'models/link'
  'text!templates/save_links.hbs'
], (tooltip, Chaplin, Syphon, View, Link, template) ->
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
      @subscribeEvent 'TagsSidebarView:tagClicked', @addTag
      @subscribeEvent 'startupController', @setupTooltips
      @delegate 'submit', 'form', @saveLink
      @modelBind 'sync', @linkAdded

    # TODO: check for duplicates, validation on url, no difference upper-lower case
    saveLink: (e) ->
      e.preventDefault()
      $('img.loading').show()
      data = Syphon.serialize @
      # TODO: does the regex work as expected?
      tag_list = data.tags.replace(/^\s+|\s+$/g, "").split ","
      link = new Link( url: data.url, tags: tag_list )
      link.save()
      @collection.add(link)
      mediator.publish 'tags:add', tag_list

    linkAdded: (item, collection, options = {}) =>
      #console.log 'SaveLinksView:linkAdded',item, collection
      mediator.publish '!router:route', 'links'

    addTag: (tag_name) ->
      inp = $('input[name=tags]')
      content = inp.val() + "," + tag_name
      inp.val(content.replace(/(^,)|(,$)/g, ""))

    setupTooltips: (e) ->
      $(@el).find('input').tooltip()

      