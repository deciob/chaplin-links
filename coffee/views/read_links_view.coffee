define [
  'chaplin'
  'views/base/collection_view'
  'views/link_view'
  'text!templates/read_links.hbs'
], (Chaplin, CollectionView, LinkView, template) ->
  'use strict'

  mediator = Chaplin.mediator

  class ReadLinksView extends CollectionView

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

    ### subview related ###
    className: 'links'
    # This is not directly a list but contains a list
    tagName: 'div' 
    id: 'link-list'
    # Append the item views to this element
    listSelector: 'ul'

    initialize: ->
      super
      @subscribeEvent 'startupController', @onStartup
      @subscribeEvent 'beforeControllerDispose', @onDisposal
      @subscribeEvent 'Links:filterd', @filterLinks

    # The most important method a class derived from CollectionView
    # must overwrite.
    getView: (item) ->
      # Instantiate an item view
      new LinkView model: item

    onStartup: (e) ->
      mediator.publish 'ReadLinks:startup'

    onDisposal: (e) ->
      mediator.publish 'ReadLinks:disposal'

    # TODO: must be something better than this! Collection.reset... ?
    filterLinks: (e) ->
      ul = $("##{@id}>ul")
      ul.find('li').addClass('hide')
      for model in e
        id = model.get('_id')
        $("##{id}").parent().show().removeClass('hide')
      ul.find('.hide').hide()





