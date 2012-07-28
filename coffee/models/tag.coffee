define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Tag extends Model

    url: '/api/tag'

    defaults:
      message: 'This is a tag!'

    #initialize: (attributes, options) ->
      #super
      #console.debug 'HelloWorld#initialize'