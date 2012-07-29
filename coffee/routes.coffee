define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->

    # Note: explain how it works!
    match '', 'saveLinks#show'
    match 'read-links', 'readLinks#show'
