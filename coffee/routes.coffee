define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->

    #match '', 'helloWorld#show'
    # Note: explain how it works!
    match '', 'saveLinks#show'
    #match 'save-links/', 'saveLinks#show'
    match 'read-links', 'readLinks#show'
    #match '', 'readLinks#show'
