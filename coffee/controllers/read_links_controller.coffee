define [
  'chaplin'
  'models/link'
  'views/read_links_view'
], (Chaplin, Link, ReadLinksView) ->
  'use strict'

  class ReadLinksController extends Chaplin.Controller

    title: 'Read links'

    #initialize: ->
    #  @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      console.debug 'ReadLinksController#show'
      @model = new Link()
      @view = new ReadLinksView model: @model