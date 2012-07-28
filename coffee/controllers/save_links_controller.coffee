define [
  'chaplin'
  'models/link'
  'models/links'
  'views/save_links_view'
], (Chaplin, Link, Links, SaveLinksView) ->
  'use strict'

  class SaveLinksController extends Chaplin.Controller

    title: 'Save links'

    initialize: ->
      @collection = new Links()

    #  @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      console.debug 'SaveLinksController#show'
      #@model = new Link()
      @view = new SaveLinksView collection: @collection#, model: @model