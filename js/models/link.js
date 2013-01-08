// Generated by CoffeeScript 1.4.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';

  var Link;
  return Link = (function(_super) {

    __extends(Link, _super);

    function Link() {
      return Link.__super__.constructor.apply(this, arguments);
    }

    Link.prototype.url = '/api/link';

    Link.prototype.defaults = {
      message: 'This is a link!'
    };

    Link.prototype.initialize = function(attributes, options) {
      return Link.__super__.initialize.apply(this, arguments);
    };

    return Link;

  })(Model);
});
