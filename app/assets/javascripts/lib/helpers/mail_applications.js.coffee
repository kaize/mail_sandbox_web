angular.module('app.helpers.mail_applications', [])
  .factory "mailAppHelper", ($rootScope) ->
    resetPaginationParams: ($scope) ->
      $scope.mailAppMessages = []
      $scope.current_page = 1
      $scope.total_pages = 1
      $scope.pages_loaded = []
      $scope.mailMessageFilter = {}
