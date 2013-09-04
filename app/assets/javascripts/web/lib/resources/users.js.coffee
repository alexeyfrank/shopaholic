angular.module('app.services.resources.users', []).factory 'Users', (railsResourceFactory) ->
  Users = railsResourceFactory
    url: Routes.api_v1_users_path()
    name: 'user'

  Users
