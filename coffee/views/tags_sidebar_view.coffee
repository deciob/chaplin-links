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

  class TagsSidebarView extends CollectionView

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    # Automatically append to the DOM on render
    container: '#tags-section'

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
      @subscribeEvent 'Links:startup', @showExtraInfo
      @subscribeEvent 'Links:disposal', @hideExtraInfo
      @subscribeEvent 'matchRoute', @removeActiveState
      @delegate 'click', 'li:.tag', @tagClicked


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

    tagClicked: (e) =>
      #if @active_links is no then return
      t = $(e.currentTarget)
      tag_name = t.html()
      @removeActiveState()
      t.addClass('active')
      mediator.publish 'TagsSidebarView:tagClicked', tag_name

    removeActiveState: ->
      $(@el).find('li').removeClass('active')



    