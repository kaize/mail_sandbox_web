angular.module('app.resources.users', [])
  .factory 'Users', (railsResourceFactory) ->
    railsResourceFactory
      url: Routes.api_users_path()
      name: 'Users'