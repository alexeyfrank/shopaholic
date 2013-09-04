#= require ./session/module
#= require ./users/module
#= require_self

angular.module('app.modules', [
  'app.modules.session'
  'app.modules.users'
])
