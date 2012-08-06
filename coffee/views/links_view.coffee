define [
  'chaplin'
  'views/base/collection_view'
  'views/link_view'
  'text!templates/read_links.hbs'
], (Chaplin, CollectionView, LinkView, template) ->
  'use strict'

  mediator = Chaplin.mediator

  class LinksView extends CollectionView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    #className: 'links-section'

    # Automatically append to the DOM on render
    container: '#links-section'

    # Automatically render after initialize
    #autoRender: true

    className: 'links'
    # This is not directly a list but contains a list
    tagName: 'div' 
    id: 'link-list'
    # Append the item views to this element
    listSelector: 'ul'

    initialize: ->
      super
      #_.extend(@options, filterer: @ft) 
      @subscribeEvent 'startupController', @onStartup
      @subscribeEvent 'beforeControllerDispose', @onDisposal
      @subscribeEvent 'TagsSidebarView:tagClicked', @setCurrentTag

    # The most important method a class derived from CollectionView
    # must overwrite.
    getView: (item) ->
      # Instantiate an item view
      new LinkView model: item

    onStartup: (e) ->
      mediator.publish 'Links:startup'

    onDisposal: (e) ->
      mediator.publish 'Links:disposal'

    setCurrentTag: (tag) =>
      @current_tag = tag
      @filter(@filterByCurrentTag)

    filterByCurrentTag: (link, idx) =>
      if @current_tag
        link_tags = link.get('tags').split ","
        current_tag = [@current_tag]
        intersection = _.intersection(current_tag, link_tags)
        if intersection.length > 0 then link else no





