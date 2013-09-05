#= require ./welcome/module
#= require ./session/module
#= require ./users/module
#= require_self

angular.module('app.modules', [
  'app.modules.welcome'
  'app.modules.session'
  'app.modules.users'
])
