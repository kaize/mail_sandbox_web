MailSandboxWeb.MailApplicationsController = Ember.ArrayController.extend({
  title: "MailApplications",
  content: [],

  init: function() {
			this._super();
//			var items = MailSandboxWeb.Store.findAll(MailSandboxWeb.MailApplication);
//			var items = MailSandboxWeb.MailApplication.findAll();

//			if ( items.get( 'length' ) ) {
//				this.set( '[]', items );
//			};
		}
});
