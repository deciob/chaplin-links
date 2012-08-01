define [
  'chaplin'
  'models/link'
  'models/links'
  'views/save_links_view'
  'views/read_links_view'
], (Chaplin, Link, Links, SaveLinksView, readLinksView) ->
  'use strict'

  class LinksController extends Chaplin.Controller

    title: 'bookmarks application'

    initialize: ->
      @collection = new Links()

    historyURL: (params) ->
      ''

    save: (params) ->
      #console.debug 'LinksController#show'
      @view = new SaveLinksView collection: @collection

    read: (params) ->
      #console.debug 'LinksController#show'
      @view = new ReadLinksView collection: @collection