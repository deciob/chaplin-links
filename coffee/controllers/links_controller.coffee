define [
  'chaplin'
  'models/links'
  'views/save_links_view'
  'views/links_view'
], (Chaplin, Links, SaveLinksView, LinksView) ->
  'use strict'

  class LinksController extends Chaplin.Controller

    title: 'Bookmarks'

    initialize: ->
      @collection = new Links()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'LinksController#show'
      @view = new LinksView collection: @collection


    save: (params) ->
      #console.debug 'SaveLinksController#show'
      @view = new SaveLinksView collection: @collection