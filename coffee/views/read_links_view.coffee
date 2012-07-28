define [
  'views/base/view'
  'text!templates/read_links.hbs'
], (View, template) ->
  'use strict'

  class ReadLinksView extends View

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    #className: 'links-section'

    # Automatically append to the DOM on render
    container: '#links-section'
    # Automatically render after initialize
    autoRender: true