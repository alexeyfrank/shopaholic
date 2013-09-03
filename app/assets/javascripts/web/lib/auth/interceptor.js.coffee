angular.module("app.services.auth.interceptor", ["app.services.auth.retryQueue"]).factory("securityInterceptor", ($injector, securityRetryQueue) ->
  (promise) ->
    promise.then null, (originalResponse) ->
      if originalResponse.status is 401
        promise = securityRetryQueue.pushRetryFn("unauthorized-server", retryRequest = ->
          $injector.get("$http") originalResponse.config
        )
      promise

).config ($httpProvider) ->
  $httpProvider.responseInterceptors.push "securityInterceptor"
