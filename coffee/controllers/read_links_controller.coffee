define [
  'chaplin'
  'models/links'
  'views/read_links_view'
], (Chaplin, Links, ReadLinksView) ->
  'use strict'

  class ReadLinksController extends Chaplin.Controller

    title: 'Read links'

    initialize: ->
      @collection = new Links()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'ReadLinksController#show'
      @view = new ReadLinksView collection: @collection