angular.module('app.notifications.service', [])
  .factory 'notifications', ($rootScope) ->
    service =
      error: (msg) ->
        $rootScope.$broadcast 'notifications:new', type: 'error', message: msg
      notice: (msg) ->
        $rootScope.$broadcast 'notifications:new', type: 'success', message: msg
      clear: ->
        $rootScope.$broadcast 'notifications:clear'

    service