define [
  'chaplin'
  'models/tag'
  'views/tags_sidebar_view'
], (Chaplin, Tag, TagsSidebarView) ->
  'use strict'

  class TagsSidebarController extends Chaplin.Controller

    title: 'Tags sidebar'

    initialize: ->
      @show()

    historyURL: (params) ->
      ''

    show: (params) ->
      #console.debug 'HelloWorldController#show'
      @model = new Tag()
      @view = new TagsSidebarView model: @model