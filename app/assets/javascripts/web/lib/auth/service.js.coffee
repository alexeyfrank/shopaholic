angular.module("app.services.auth.service", []).factory "auth", ($http, $q, $state, notifications, $rootScope) ->
  redirect = (state) ->
    $state.transitionTo state

  # Register a handler for when an item is added to the retry queue
  #  securityRetryQueue.onItemAddedCallbacks.push (retryItem) ->
  # service.showLogin()  if securityRetryQueue.hasMore()

  # The public API of the service
  service =
    # Get the first reason for needing a login
    #  getLoginReason: ->
    # securityRetryQueue.retryReason()

    # Show the modal login dialog
    showLogin: ->
      redirect('new_session')

    # Attempt to authenticate a user by the given email and password
    login: (credentials) ->
      deferred = $q.defer()
      request = $http.post(Routes.api_v1_session_path(),
        user: credentials
      ).then((response) ->
        service.currentUser = response.data.user
        if service.isSignedIn()
          deferred.resolve(service.currentUser)
          redirect('root')
      , (response) ->
        deferred.reject()
      )
      deferred.promise

    # Logout the current user and redirect
    logout: (redirectTo) ->
      $http.delete(Routes.api_v1_session_path()).then ->
        service.currentUser = null
        redirect redirectTo

    # Ask the backend to see if a user is already authenticated - this may be from a previous session.
    requestCurrentUser: ->
      if service.isSignedIn()
        $q.when service.currentUser
      else
        $http.get(Routes.api_v1_session_path()).then (response) ->
          service.currentUser = response.data.user
          service.currentUser

    # Information about the current user
    currentUser: null
    # Is the current user authenticated?
    isSignedIn: ->
      !!service.currentUser

    authenticateRoute: (route, event) ->
      if route.auth and !service.isSignedIn()
        event.preventDefault()
        $state.transitionTo('new_session')
        notifications.error 'User not authorized!'

  service
