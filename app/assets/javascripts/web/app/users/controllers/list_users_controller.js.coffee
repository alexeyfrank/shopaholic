angular.module('app.modules.users.controllers.list_users', []).controller 'ListUsersController', ($scope, Users, $state) ->
  $scope.users = Users.query()

  $scope.new = ->
    $state.transitionTo 'new_user'

  $scope.edit = (user) ->
    $state.transitionTo 'edit_user', id: user.id

  $scope.destroy = (user) -> 
    Users.destroy(user)
