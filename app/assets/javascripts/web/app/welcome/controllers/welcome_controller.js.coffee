angular.module('app.modules.welcome.controllers').controller 'WelcomeController', ($scope, Users, $state) ->
  Users.query().then (users) -> $scope.users = users
