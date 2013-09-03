angular.module('app.services.navbar.controllers', []).controller('NavbarController', ($scope, auth, $state) ->
  $scope.isSignedIn = -> auth.isSignedIn()
  $scope.currentUser = -> auth.currentUser

  $scope.logout = ->
    auth.logout('root')
)
