define [
  'chaplin'
  'models/links'
  'models/tags'
  'views/save_links_view'
  'views/read_links_view'
  'views/tags_sidebar_view_esit'
  'views/tags_sidebar_view_save'
], (Chaplin, Links, Tags, SaveLinksView, readLinksView, TagsSidebarViewEdit, TagsSidebarViewSave) ->
  'use strict'

  class LinksController extends Chaplin.Controller

    title: 'bookmarks application'

    initialize: ->
      @linkCollection = new Links()
      @tagCollection = new Tags()

    historyURL: (params) ->
      ''

    #startup: (params) ->
    #  @linkCollection = new Links()
    #  @tagCollection = new Tags()
    #  @tags = 


    save: (params) ->
      #console.debug 'LinksController#show'
      tags = new TagsSidebarViewSave collection: @tagCollection
      @view = new SaveLinksView collection: @linkCollection
        rightView: tags

    read: (params) ->
      #console.debug 'LinksController#show'
      tags = new TagsSidebarViewRead collection: @tagCollection
      @view = new ReadLinksView collection: @collection
        rightView: tags