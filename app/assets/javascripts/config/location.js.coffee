angular.module('app').config(["$routeProvider", ($routeProvider) ->
]).run ($rootScope) ->
  $rootScope.$on "$locationChangeStart", (event, next, current) ->
    if next == App.host && next != current
      window.location = '/'
