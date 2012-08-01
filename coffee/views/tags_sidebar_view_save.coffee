define [
  'chaplin'
  'views/tags_sidebar_view_base'
  'views/tag_view'
  'models/tag'
  'text!templates/tags_sidebar.hbs'
], (Chaplin, TagsSidebarViewBase, TagView, Tag, template) ->
  'use strict'

  # Shortcut to the mediator
  mediator = Chaplin.mediator

  class TagsSidebarView extends TagsSidebarViewBase

    



    