angular.module('app.modules.users.controllers').controller 'EditUserController', ($scope, Users, notifications, $state, $stateParams) ->
  Users.get($stateParams.id).then (user) ->
    $scope.user = user

  $scope.save = ->
    $scope.user.update().then(
      -> notifications.notice('User has successfully updated!')
    , (response) -> $scope.form.errors = response.data.errors
    )
