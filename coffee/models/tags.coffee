define [
  'chaplin',
  'models/base/collection'
  'models/tag'
], (Chaplin, Collection, Tag) ->
  'use strict'

  class Tags extends Collection

    # Mixin a SyncMachine
    _(@prototype).extend Chaplin.SyncMachine

    model: Tag

    url: '/api/tags'

    defaults:
      message: 'This is a tag collection!'

    initialize: (attributes, options) ->
      super
      #console.debug 'Tags#initialize'
      @beginSync()

      # state: unsynced
      @fetch().done(@go)
      
    go: =>
      # state: syncing
      @finishSync()
      # state: synced

    filterByTagName: (name) ->
      @filter (tag) ->
        if tag.get('name') == name then tag else no

