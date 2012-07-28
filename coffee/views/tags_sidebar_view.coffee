define [
  'views/base/collection_view'
  'views/tag_view'
  'models/tag'
  'text!templates/tags_sidebar.hbs'
], (CollectionView, TagView, Tag, template) ->
  'use strict'

  class TagsSidebarView extends CollectionView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    className: 'sidebar'

    tagName: 'div' # This is not directly a list but contains a list
    id: 'tag-list'

    # Append the item views to this element
    listSelector: 'ol'

    # Automatically append to the DOM on render
    container: '#tags-section'
    # Automatically render after initialize
    #autoRender: true

    initialize: ->
      super
      @subscribeEvent 'tags:add', @addTags
      #@collection.synced @render

    addTags: (tag_list) ->
      for name in tag_list
        tag = new Tag name: name
        @collection.add(tag)
        tag.save()

    # The most important method a class derived from CollectionView
    # must overwrite.
    getView: (item) ->
      # Instantiate an item view
      new TagView model: item

    