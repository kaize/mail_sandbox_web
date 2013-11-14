angular.module('app.services.faye', [])
  .factory 'Faye', ($rootScope) ->
    faye = new Faye.Client(App.config.faye_url)

    subscribe: (channel, callback) ->
      faye.subscribe channel, (data) ->
        callback data