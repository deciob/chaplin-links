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
      #console.debug 'HelloWorld#initialize'
      @subscribeEvent 'TagsSidebarView:filterLinks', @rs 
      @initSyncMachine()
      @fetch()


    filterByTag: (tag) ->
      @filter (link) ->
        link_tags = link.get('tags')
        in_tags = [tag]
        out_tags = link_tags.split ","
        intersection = _.intersection(in_tags, out_tags)
        l = if intersection.length > 0 then link else no
        
    rs: (tag) =>
      filtered = @filterByTag(tag)
      mediator.publish 'Links:filterd', filtered
      console.log filtered


    #list: function(id) {
    #    return this.filter(function(task) {
    #        return task.get('list') == id;
    #    });
    #}
      