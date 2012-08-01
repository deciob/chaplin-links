define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->

    # Note: explain how it works!
    match '', 'links#save'
    match 'read-links', 'links#read'

    match '', 'tags#save'
    match 'read-links', 'tags#read'
