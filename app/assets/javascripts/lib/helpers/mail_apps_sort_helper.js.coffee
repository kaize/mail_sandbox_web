angular.module('app.helpers.mail_apps_sort', [])
  .factory "mailAppsSortHelper", ($rootScope) ->

    comparator : (field, reverse, block) ->
      key = (if block then (x) ->
        block x[field]
       else (x) ->
        x[field]
      )

      reverse = [-1, 1][+!!reverse]

      (a, b) ->
        a = key(a)
        b = key(b)
        reverse * ((a > b) - (b > a))