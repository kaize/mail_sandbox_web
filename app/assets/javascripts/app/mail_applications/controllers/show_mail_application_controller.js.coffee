angular.module('app.modules.mail_applications.controllers')
  .controller 'ShowMailApplicationController',
    ($scope, mailApplications, mailMessagesHelper, mailMessages, Faye, $state, $stateParams, $sce) ->
      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      Faye.subscribe App.config.faye_channel_message_new, (message) ->
        console.log(message.mail_application)
        if ($scope.mailApp.name == message.mail_application)
          $scope.mailAppMessages.splice(0, 0, message)
          $scope.mailAppMessages.pop()

      resetPaginationParams = ->
        $scope.mailAppMessages = []
        $scope.current_page = 1
        $scope.total_pages = 1
        $scope.pages_loaded = []

      $scope.mailMessageFilter = {}
      resetPaginationParams()

      $scope.ransackParamsPicking = ->
        resetPaginationParams()
        $scope.ransack_params = mailMessagesHelper.ransackParamsFilling($scope.messageFilterMask)

      $scope.ransackParamsDrop = ->
        resetPaginationParams()
        $scope.messageFilterMask = {}

      $scope.editMailApp = (mailApp) ->
        $state.transitionTo 'edit_mail_application', { id: mailApp.id }

      $scope.loadMore = ->
        if $scope.total_pages >= $scope.current_page
          if !_.include($scope.pages_loaded, $scope.current_page)

            params = { page: $scope.current_page }
            mailMessages.query(_.extend(params, $scope.ransack_params), { mail_application_id: $stateParams.id }).then (results) ->
              $scope.mailAppMessages = $scope.mailAppMessages.concat(results.items)

              $scope.total_pages = results.meta.total_pages

              $scope.current_page++

          $scope.pages_loaded.push($scope.current_page)

      $scope.showMailAppMessage = (message) ->
        $scope.resourceMessage = message

        #TODO: move to services
        if $scope.resourceMessage.state == 'unread'
          $scope.resourceMessage.state = 'read'

          params = { id: message.id, mail_application_id: $stateParams.id, state_event: 'mark_read' }
          new mailMessages(params).update()

        $scope.resourceMessageBody = $sce.trustAsHtml(message.body)

      $scope.showMailAppMessageRaw = (message) ->
        $state.transitionTo 'raw_mail_message', { id: message.id, mail_application_id: $stateParams.id }
      $scope.showMailAppMessageWithoutBootstrap = (message) ->
        $state.transitionTo 'without_bootstrap_mail_message', { id: message.id, mail_application_id: $stateParams.id }