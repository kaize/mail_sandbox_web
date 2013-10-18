angular.module('app.modules.mail_applications.controllers')
  .controller 'ShowMailApplicationController',
    ($scope, mailApplications, mailMessages, $state, $stateParams) ->
      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      $scope.mailAppMessages = []
      $scope.current_page = 1
      $scope.total_pages = 1
      pages_loaded = []

      $scope.loadMore = ->
        if $scope.total_pages >= $scope.current_page
          if !_.include(pages_loaded, $scope.current_page)
            mailMessages.query({ page: $scope.current_page }, { mail_application_id: $stateParams.id }).then (results) ->

              $scope.mailAppMessages = $scope.mailAppMessages.concat(results.items)

              $scope.total_pages = results.meta.totalPages

              $scope.current_page++

          pages_loaded.push($scope.current_page)