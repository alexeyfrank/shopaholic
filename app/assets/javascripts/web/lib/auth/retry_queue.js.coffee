angular.module("app.services.auth.retryQueue", []).factory "securityRetryQueue", ($q, $log) ->
  retryQueue = []
  service =
    # The security service puts its own handler in here!
    onItemAddedCallbacks: []
    hasMore: ->
      retryQueue.length > 0

    push: (retryItem) ->
      retryQueue.push retryItem
      # Call all the onItemAdded callbacks
      angular.forEach service.onItemAddedCallbacks, (cb) ->
        try
          cb retryItem
        catch e
          $log.error "securityRetryQueue.push(retryItem): callback threw an error" + e

    pushRetryFn: (reason, retryFn) ->
      # The reason parameter is optional
      if arguments_.length is 1
        retryFn = reason
        reason = `undefined`
      # The deferred object that will be resolved or rejected by calling retry or cancel
      deferred = $q.defer()
      retryItem =
        reason: reason
        retry: ->
          # Wrap the result of the retryFn into a promise if it is not already
          $q.when(retryFn()).then ((value) ->
            # If it was successful then resolve our deferred
            deferred.resolve value
          ), (value) ->
            # Othewise reject it
            deferred.reject value

        cancel: ->
          # Give up on retrying and reject our deferred
          deferred.reject()

      service.push retryItem
      deferred.promise

    retryReason: ->
      service.hasMore() and retryQueue[0].reason

    cancelAll: ->
      retryQueue.shift().cancel()  while service.hasMore()

    retryAll: ->
      retryQueue.shift().retry()  while service.hasMore()

  service
