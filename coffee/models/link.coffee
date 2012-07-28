define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Link extends Model

    url: '/api/link'

    defaults:
      message: 'This is a link!'

    initialize: (attributes, options) ->
      super
      #console.debug 'HelloWorld#initialize'
      @initSyncMachine()