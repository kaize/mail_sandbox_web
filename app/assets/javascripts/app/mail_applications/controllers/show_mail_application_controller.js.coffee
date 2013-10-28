angular.module('app.modules.mail_applications.controllers')
  .controller 'ShowMailApplicationController',
    ($scope, mailApplications, mailMessages, Faye, $state, $stateParams, $sce) ->
      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      Faye.subscribe App.config.faye_channel_message_new, (data) ->
        $scope.mailAppMessages.splice(0, 0, data)
        $scope.mailAppMessages.pop()

      $scope.mailAppMessages = []
      $scope.current_page = 1
      $scope.total_pages = 1
      pages_loaded = []

      $scope.loadMore = ->
        if $scope.total_pages >= $scope.current_page
          if !_.include(pages_loaded, $scope.current_page)
            mailMessages.query({ page: $scope.current_page }, { mail_application_id: $stateParams.id }).then (results) ->
              $scope.mailAppMessages = $scope.mailAppMessages.concat(results.items)

              $scope.total_pages = results.meta.total_pages

              $scope.current_page++

          pages_loaded.push($scope.current_page)

      $scope.showMailAppMessage = (message) ->
        console.log(message)
        $scope.resourceMessage = message

        #TODO: move to services
        if $scope.resourceMessage.state == 'unread'
          $scope.resourceMessage.state = 'read'
          mailMessages.markRead({id: message.id, mail_application_id: $stateParams.id})

        $scope.resourceMessageBody = $sce.trustAsHtml(message.body)

      $scope.showMailAppMessageRaw = (message) ->
        $state.transitionTo 'raw_mail_message', { id: message.id, mail_application_id: $stateParams.id }
      $scope.showMailAppMessageWithoutBootstrap = (message) ->
        $state.transitionTo 'without_bootstrap_mail_message', { id: message.id, mail_application_id: $stateParams.id }