angular.module('app.services.auth', [
  'app.services.auth.interceptor',
  'app.services.auth.service',
  'app.services.auth.retryQueue'
])
