angular.module('app.modules.mail_applications.controllers')
  .controller 'ShowMailApplicationController',
    ($scope, $rootScope, mailApplications, mailMessages, Faye, $state, $stateParams, $sce, _) ->

      #state transition to other controllers
      $scope.showMailAppMessage = (message) ->
        $state.transitionTo 'show_mail_application.show_mail_message',
          { mail_message_id: message.id, id: $scope.mailApp.id }
      $scope.showMailAppMessageRaw = (message) ->
        $state.transitionTo 'raw_mail_message', { id: message.id, mail_application_id: $stateParams.id }
      $scope.showMailAppMessageWithoutBootstrap = (message) ->
        $state.transitionTo 'without_bootstrap_mail_message', { id: message.id, mail_application_id: $stateParams.id }

      #subscription on events
      $scope.$on('filter_form:submit', (event, filterParams) ->
        resetPaginationParams()

        $scope.filterParams = filterParams

        $scope.loadMore()
        )

      $scope.$on('filter_form:cancel', (event) ->
        resetPaginationParams()

        $scope.filterParams = {}

        $scope.loadMore()
        )

      $scope.$on('mail_message:mark_read', (event, resourceMessage) ->
        resource_message = _.find($scope.mailAppMessages, (message) ->
          message.id == resourceMessage.id
        )
        resource_message.state = "read"
      )

      Faye.subscribe App.config.faye_channel_message_new, (message) ->
        if $scope.mailApp.name == message.mail_application

          $scope.mailAppMessages.splice(0, 0, message)
          $scope.mailAppMessages.pop()
          $scope.$apply()

      #infinity scroll utils
      resetPaginationParams = ->
        $scope.mailAppMessages = []
        $scope.current_page = 1
        $scope.total_pages = 1
        $scope.pages_loaded = []

      $scope.loadMore = ->
        if $scope.total_pages >= $scope.current_page
          if !_.include($scope.pages_loaded, $scope.current_page)

            params = { page: $scope.current_page }
            $scope.messagesLoading = true

            mailMessages.query(_.extend(params, $scope.filterParams), { mail_application_id: $stateParams.id }).then (results) ->
              $scope.mailAppMessages = $scope.mailAppMessages.concat(results.items)

              $scope.total_pages = results.meta.total_pages

              $scope.current_page++

              $scope.messagesLoading = false

          $scope.pages_loaded.push($scope.current_page)

      #checkboxes management
      uncheckMaster = ->
        $scope.masterChbox = false

      $scope.isChecked = (message) ->
        message.isChecked

      $scope.checkAllMessages = ->
        _.map($scope.mailAppMessages, (message) ->
          message.isChecked = true
        )

      $scope.unCheckAllMessages = ->
        _.map($scope.mailAppMessages, (message) ->
          message.isChecked = false
        )

      $scope.onMasterChboxChange = ->
        if $scope.masterChbox
          $scope.checkAllMessages()
        else
          $scope.unCheckAllMessages()

      getCheckedMessages = ->
        _.filter($scope.mailAppMessages, (message) ->
          message.isChecked
        )
      getCheckedMessagesIds = (checkedMessages) ->
        _.pluck(checkedMessages, 'id')

      $scope.markReadCheckedMessages = ->
        checkedMessages = getCheckedMessages()
        checkedMessagesIds = getCheckedMessagesIds(checkedMessages)

        _.map(checkedMessages, (message) ->
          message.state = 'read'
        )

        mailMessages.batchUpdate({
          mail_application_id: $stateParams.id,
          ids: checkedMessagesIds,
          mail_message: { state_event: 'mark_read' }
        })
        uncheckMaster()
        $scope.unCheckAllMessages()

      currentShowingMessageIsDeleted = (deletedMessagesIds) ->
        _.contains(deletedMessagesIds, $rootScope.currentShowingMessageId)

      $scope.deleteCheckedMessages = ->
        checkedMessages = getCheckedMessages()
        checkedMessagesIds = getCheckedMessagesIds(checkedMessages)

        mailMessages.batchUpdate({
          mail_application_id: $stateParams.id,
          mail_message: { state_event: 'mark_as_deleted' },
          ids: checkedMessagesIds
        }).then ->
          if currentShowingMessageIsDeleted(checkedMessagesIds)
            $state.transitionTo 'show_mail_application', { id: $scope.mailApp.id }
            $rootScope.showMessageDummy = true
            $rootScope.currentShowingMessageId = null

          $scope.mailAppMessages = _.difference($scope.mailAppMessages, checkedMessages)

          uncheckMaster()
          $scope.unCheckAllMessages()

          resetPaginationParams()
          $scope.loadMore()

      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      resetPaginationParams()
      $scope.loadMore()

      uncheckMaster()
