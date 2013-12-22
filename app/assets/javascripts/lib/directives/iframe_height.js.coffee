angular.module('app.directives').directive "iframeHeight", ($timeout) ->
  link: (scope, element, attr) ->
    $timeout ->
      element.load ->
        height = element.get(0).contentWindow.document.body.scrollHeight
        element.css("height", height)
