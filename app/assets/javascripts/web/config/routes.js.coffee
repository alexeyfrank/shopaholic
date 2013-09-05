angular.module('app').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state('root',
      url: '/'
      templateUrl: RouterHelper.templateUrl('welcome/index')
      controller: 'WelcomeController'
    )
    .state('new_session',
      url: "/session/new"
      templateUrl: RouterHelper.templateUrl('session/new')
      controller: 'NewSessionController'
    )
    .state('users', 
      url: "/users"
      templateUrl: RouterHelper.templateUrl('users/index')
      controller: 'ListUsersController'
      auth: true
    )
    .state('new_user',
      url: '/users/new'
      templateUrl: RouterHelper.templateUrl('users/new')
      controller: 'NewUserController'
      auth: true
    )
    .state('edit_user',
      url: '/users/{id}'
      templateUrl: RouterHelper.templateUrl('users/edit')
      controller: 'EditUserController'
      auth: true
    )
