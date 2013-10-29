angular.module('app.directives').directive 'formField', ($parse, $compile) ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: RouterHelper.templateUrl('directives/forms/field')
  scope:
    type: '@'
    ngModel: '='
    errors: '='

  link: ($scope, $element, $attrs) ->
    $scope.getType = -> $scope.type or 'text'