angular.module('app.modules.mail_applications.controllers')
  .controller 'FilterMessagesController',
    ($scope, $rootScope, mailApplications, messagesFilterHelper, $sce, _) ->

      $scope.filters = []
      $scope.messagesFilterMask = {}

      $scope.options = [
        { title: 'state',        isSelected: false },
        { title: 'recipient',    isSelected: false },
        { title: 'sender',       isSelected: false },
        { title: 'completed_at', isSelected: false },
        { title: 'subject',      isSelected: false }
      ]

      $scope.addFilter = ->
        _.map($scope.options, (item) ->
          if $scope.selectedFilter == item.title
            item.isSelected = true
        )
        $scope.filters.push($scope.selectedFilter)

      $scope.hasFilter = (filter) ->
        _.contains($scope.filters, filter)

      $scope.removeFilter = (filter) ->
        $scope.filters = _.reject($scope.filters, (item) ->
          filter == item
        )
        _.map($scope.options, (item) ->
          if filter == item.title
            item.isSelected = false
        )
        $scope.selectedFilter = ""
        delete $scope.messagesFilterMask[filter]

      $scope.filterParamsPicking = ->
        $scope.filterParams = messagesFilterHelper.filterParamsFilling($scope.messagesFilterMask)

        $rootScope.$broadcast('filter_form:submit', $scope.filterParams)

      $scope.filterParamsDrop = ->
        $scope.messagesFilterMask = {}
        $scope.filters = []
        $scope.selectedFilter = ""

        _.each($scope.options, (item) ->
            item.isSelected = false
        )

        $rootScope.$broadcast('filter_form:cancel')

