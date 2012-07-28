define [
  'chaplin'
  'views/head_nav_view'
], (Chaplin, HeadNavView) ->
  'use strict'

  class HeadNavController extends Chaplin.Controller

    title: 'savemylinks nav'

    initialize: ->
      @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'HeadNavController#show'
      @view = new HeadNavView()