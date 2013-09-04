angular.module('app.modules.users.controllers').controller 'NewUserController', ($scope, Users, notifications, $state, $stateParams) ->
  $scope.user = {}

  $scope.save = ->
    user = new Users($scope.user)
    user.create().then(
      -> notifications.notice('Users successfull created!')
    , (response) -> $scope.form.errors = response.data.errors
    )
