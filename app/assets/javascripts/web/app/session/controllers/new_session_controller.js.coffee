angular.module('app.modules.session.controllers')
  .controller 'NewSessionController', ($scope, $state, auth, notifications) ->
    $scope.user = {}

    $state.transitionTo 'root' if auth.isSignedIn()

    $scope.login = ->
      auth.login($scope.user)
        .then (user) ->
          notifications.notice 'Auth successfull!'
        , -> 
          notifications.error 'Auth failed!'
