define [
  'chaplin'
  'views/base/collection_view'
  'views/tag_view'
  'models/tag'
  'text!templates/tags_sidebar.hbs'
], (Chaplin, CollectionView, TagView, Tag, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class TagsSidebarViewBase extends CollectionView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    # Automatically append to the DOM on render
    container: '#tags-section'

    ### subview related ###
    className: 'sidebar'
    # This is not directly a list but contains a list
    tagName: 'div' 
    id: 'tag-list'
    # Append the item views to this element
    listSelector: 'ul'

    # Used for different behaviour depending on liks state
    active_links: no

    initialize: ->
      super
      @extra_info = $(@el).find('.extra-info')
      @subscribeEvent 'tags:add', @addTags
      # TODO: is there a better solution? Should these go through the
      # `ReadLinksController`, instead of the `ReadLinksView`?
      @subscribeEvent 'ReadLinks:startup', @showExtraInfo
      @subscribeEvent 'ReadLinks:disposal', @hideExtraInfo
      @delegate 'click', 'li:.tag', @filterLinks

    addTags: (tag_list) ->
      for name in tag_list
        existing_tag = @collection.filterByTagName(name)
        # if this is an existing tag do not save...
        if existing_tag.length == 0
          tag = new Tag name: name
          @collection.add(tag)
          tag.save()

    # The most important method a class derived from CollectionView
    # must overwrite.
    getView: (item) ->
      # Instantiate an item view
      new TagView model: item

    showExtraInfo: =>
      @extra_info.show()
      $(@el).find('li').css('cursor', 'pointer')
      @active_links = yes

    hideExtraInfo: =>
      @extra_info.hide()
      $(@el).find('li').css('cursor', '')
      @active_links = no

    filterLinks: (e) =>
      if @active_links is no then return
      tag_name = $(e.currentTarget).html()
      mediator.publish 'TagsSidebarView:filterLinks', tag_name



    