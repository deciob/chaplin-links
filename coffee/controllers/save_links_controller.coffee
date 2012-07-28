define [
  'chaplin'
  'models/link'
  'views/save_links_view'
], (Chaplin, Link, SaveLinksView) ->
  'use strict'

  class SaveLinksController extends Chaplin.Controller

    title: 'Save links'

    #initialize: ->
    #  @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      console.debug 'SaveLinksController#show'
      @model = new Link()
      @view = new SaveLinksView model: @model