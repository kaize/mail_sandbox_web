angular.module('app.directives').directive "filterItemShow", ->
  replace: true
  restrict: "A"
  link: (scope, element, attr) ->

    scope.$watch attr.filterItemShow, (value) ->
      element.parent().addClass("filter_item_container")
      element.css "display", (if value then "" else "none")
      if value
        $(".filter_item_container").append(element)