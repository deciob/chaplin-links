define [
  'views/base/view'
  'text!templates/save_links.hbs'
], (View, template) ->
  'use strict'

  class SaveLinksView extends View

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    className: 'sidebar'

    # Automatically append to the DOM on render
    container: '#links-section'
    # Automatically render after initialize
    autoRender: true