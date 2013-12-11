angular.module('app').config (railsSerializerProvider) ->
    railsSerializerProvider
      .camelize (name) ->
        name