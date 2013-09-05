# For rails csrf security
angular.module('app').config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken


angular.module('app').run ($rootScope, $state, auth, notifications) ->
  auth.requestCurrentUser().then ->
    $rootScope.$on('$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      notifications.clear()
      auth.authenticateRoute toState, event
    )
