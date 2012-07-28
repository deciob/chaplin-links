define [
  'views/base/view'
  'text!templates/tags_sidebar.hbs'
], (View, template) ->
  'use strict'

  class TagsSidebarView extends View

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template = null

    className: 'sidebar'

    # Automatically append to the DOM on render
    container: '#tags-section'
    # Automatically render after initialize
    autoRender: true