// Generated by CoffeeScript 1.3.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'text!templates/read_links.hbs'], function(View, template) {
  'use strict';

  var ReadLinksView;
  return ReadLinksView = (function(_super) {

    __extends(ReadLinksView, _super);

    function ReadLinksView() {
      return ReadLinksView.__super__.constructor.apply(this, arguments);
    }

    ReadLinksView.prototype.template = template;

    template = null;

    ReadLinksView.prototype.container = '#links-section';

    ReadLinksView.prototype.autoRender = true;

    return ReadLinksView;

  })(View);
});
