define [
  'chaplin'
  'models/tags'
  'views/tags_sidebar_view_esit'
  'views/tags_sidebar_view_save'
], (Chaplin, Tags, TagsSidebarViewEdit, TagsSidebarViewSave) ->
  'use strict'

  class tagsController extends Chaplin.Controller

    title: 'Tags sidebar'

    initialize: ->
      @collection = new Tags()
      #@show()

    historyURL: (params) ->
      ''

    read: (params) ->
      console.debug 'TagsSidebarController#show'
      @view = new TagsSidebarViewRead collection: @collection

    save: (params) ->
      console.debug 'TagsSidebarController#edit'
      @view = new TagsSidebarViewEdit collection: @collection