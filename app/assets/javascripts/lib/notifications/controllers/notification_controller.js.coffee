angular.module('app.notifications.controllers', [])
  .controller('NotificationsController', ($rootScope, $scope) ->
    $scope.notification = null
    $rootScope.$on 'notifications:new', (event, notification) ->
      $scope.notification = notification

    $rootScope.$on 'notifications:clear', ->
      $scope.notification = null

    $scope.isVisible = ->
      $scope.notification != null
  )