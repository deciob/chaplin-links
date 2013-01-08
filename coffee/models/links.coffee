define [
  'chaplin',
  'models/base/collection'
  'models/link'
], (Chaplin, Collection, Link) ->
  'use strict'

  mediator = Chaplin.mediator

  class Links extends Collection

    # Mixin a SyncMachine
    #_(@prototype).extend Chaplin.SyncMachine

    model: Link
    url: '/api/links'

    #localStorage: new Chaplin.LocalStorage("links-backbone")

    defaults:
      message: 'This is a link collection!'

    initialize: (attributes, options) ->
      super
      #console.debug 'Links#initialize', attributes, options
      @fetch()

      