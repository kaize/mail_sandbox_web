#= require ./mail_applications/module
#= require ./mail_applications/mail_messages/module
#= require_self

angular.module('app.modules', [
  'app.modules.mail_applications'
  'app.modules.mail_applications.mail_messages'
])