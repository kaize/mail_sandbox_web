angular.module('app').config(["$routeProvider", ($routeProvider) ->
]).run ($rootScope) ->
  $rootScope.$on "$locationChangeStart", (event, next, current) ->
    console.log next
    console.log App.host
    if next == App.host && next != current
      window.location = '/'