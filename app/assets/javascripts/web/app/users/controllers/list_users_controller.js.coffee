angular.module('app.modules.users.controllers').controller 'ListUsersController', ($scope, notifications, Users, $state, _) ->

  Users.query().then (users) -> $scope.users = users

  $scope.new = ->
    $state.transitionTo 'new_user'

  $scope.edit = (user) ->
    $state.transitionTo 'edit_user', id: user.id

  $scope.destroy = (user) -> 
    user.delete().then ->
      $scope.users = _.without($scope.users, user)
      notifications.notice('User successfully deleted!')
