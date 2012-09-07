MailSandboxWeb.Router = Ember.Router.extend({
  root: Ember.Route.extend({

    index: Ember.Route.extend({
      route: '/',
      connectOutlets: function(router) {
        router.transitionTo('mailApplications');
      }

    }),

    mailApplications: Ember.Route.extend({
      route: '/mail_applications',
      connectOutlets: function(router) {
        var controller = router.get( 'applicationController' );
        controller.connectOutlet('mailApplications')
      }
    })
  })
});

