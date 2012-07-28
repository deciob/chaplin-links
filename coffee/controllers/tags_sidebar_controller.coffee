define [
  'chaplin'
  'models/tags'
  'views/tags_sidebar_view'
], (Chaplin, Tags, TagsSidebarView) ->
  'use strict'

  class TagsSidebarController extends Chaplin.Controller

    title: 'Tags sidebar'

    initialize: ->
      @collection = new Tags()
      @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'HelloWorldController#show'
      @view = new TagsSidebarView collection: @collection