define [
  'views/base/view'
  'text!templates/head_nav.hbs'
], (View, template) ->
  'use strict'

  class HeadNavView extends View

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    #className: 'head-nav'

    # Automatically append to the DOM on render
    container: '#nav-head'
    # Automatically render after initialize
    autoRender: true

    initialize: ->
      super
      @subscribeEvent 'matchRoute', @setNavBtn

    setNavBtn: (e) ->
      $('ul:.nav > li').removeClass('active')
      $(@el).find('a[href="/'+e.pattern+'"]').parent().addClass('active')