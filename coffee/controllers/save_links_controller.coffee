define [
  'chaplin'
  'models/link'
  'models/links'
  'views/save_links_view'
], (Chaplin, Link, Links, SaveLinksView) ->
  'use strict'

  class SaveLinksController extends Chaplin.Controller

    title: 'Save bookmark'

    initialize: ->
      @collection = new Links()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'SaveLinksController#show'
      @view = new SaveLinksView collection: @collection#, model: @model