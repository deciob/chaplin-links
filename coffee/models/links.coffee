define [
  'chaplin',
  'models/base/collection'
  'models/link'
], (Chaplin, Collection, Link) ->
  'use strict'

  class Links extends Collection

    model: Link

    #localStorage: new Chaplin.LocalStorage("links-backbone")

    defaults:
      message: 'This is a link collection!'

    initialize: (attributes, options) ->
      super
      #console.debug 'HelloWorld#initialize'
      @initSyncMachine()
      