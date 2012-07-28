define [
  'chaplin',
  'models/base/collection'
  'models/tag'
], (Chaplin, Collection, Tag) ->
  'use strict'

  class Tags extends Collection

    model: Tag

    url: '/api/tags'

    defaults:
      message: 'This is a tag collection!'

    initialize: (attributes, options) ->
      super
      #console.debug 'Tags#initialize'
      @initSyncMachine()
      @beginSync()

      # state: unsynced
      @fetch().done(@go)
      
    go: =>
      # state: syncing
      @finishSync()
      # state: synced

