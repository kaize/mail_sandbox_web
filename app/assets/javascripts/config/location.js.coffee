angular.module('app').config(["$routeProvider", ($routeProvider) ->
]).run ($rootScope) ->
  $rootScope.$on "$locationChangeStart", (event, next, current) ->
    if next == App.host && next != current
      window.location = '/'

  $rootScope.$on('$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
    $rootScope.showMessageDummy = false

    if toState.name == "show_mail_application"
      $rootScope.showMessageDummy = true
      $rootScope.currentShowingMessageId = null
  )