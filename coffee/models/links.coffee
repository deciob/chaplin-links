define [
  'chaplin',
  'models/base/collection'
  'models/link'
], (Chaplin, Collection, Link) ->
  'use strict'

  mediator = Chaplin.mediator

  class Links extends Collection

    model: Link
    url: '/api/links'

    #localStorage: new Chaplin.LocalStorage("links-backbone")

    defaults:
      message: 'This is a link collection!'

    initialize: (attributes, options) ->
      super
      #console.debug 'Links#initialize', attributes, options
      @initSyncMachine()
      @fetch()

      