angular.module('app.modules.mail_applications.controllers')
  .controller 'ListMailApplicationsController',
    ($scope, mailApplications, mailAppsSortHelper, $state, $stateParams, _) ->

      #pagination
      resetPagination = ->
        $scope.currentPage = 1
        $scope.onSelectPage(1)

      $scope.onSelectPage = (page) ->
        left_index = (page - 1) * $scope.mailAppsPerPage
        right_index = left_index + $scope.mailAppsPerPage
        $scope.currentShowingMailApps = $scope.mailApps.slice(left_index, right_index)


      #sort
      sortMailAppsByStringFields = (stringField) ->
        $scope.predicate = stringField
        $scope.reverse = !$scope.reverse
        $scope.mailApps.sort(mailAppsSortHelper.comparator(
          $scope.predicate, $scope.reverse,  (elem) -> elem.toUpperCase()
          )
        )

      $scope.sortMailAppsByName = ->
        sortMailAppsByStringFields("name")
        resetPagination()

      $scope.sortMailAppsByCreatorNickname = ->
        sortMailAppsByStringFields("creator_nickname")
        resetPagination()

      $scope.sortMailAppsByUnreadMailsCount = ->
        $scope.predicate = 'unread_mails_count'
        $scope.reverse = !$scope.reverse
        $scope.mailApps.sort(
          mailAppsSortHelper.comparator(
            $scope.predicate, $scope.reverse, parseInt
          )
        )
        resetPagination()


      #state transition to other controllers
      $scope.new = ->
        $state.transitionTo 'new_mail_application'
      $scope.show = (mailApp) ->
        $state.transitionTo 'show_mail_application', id: mailApp.id
      $scope.edit = (mailApp) ->
        $state.transitionTo 'edit_mail_application', id: mailApp.id
      $scope.destroy = (mailApp) ->
        deleteMailApp = confirm('Are you sure you want to delete app and all messages?')
        if deleteMailApp
          mailApp.delete().then ->
            $scope.mailApps = _.reject($scope.mailApps, (app) ->
              app == mailApp
            )
            resetPagination()

      $scope.mailAppsLoading = true

      mailApplications.get().then (results) ->
        $scope.mailApps = results

        $scope.reverse = false
        sortMailAppsByStringFields("name")

        $scope.mailAppsPerPage = 5
        resetPagination()

        $scope.mailAppsLoading = false