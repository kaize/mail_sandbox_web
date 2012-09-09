MailSandboxWeb.MailApplicationsCollectionController = Ember.ArrayProxy.extend({
  init: function() {
			this._super();
			var items = MailSandboxWeb.Store.findAll(MailSandboxWeb.MailApplication);
      this.set( 'content', items );
      window.collection_controller = this

		}
});
MailSandboxWeb.Controllers.MailApplicationsCollection = MailSandboxWeb.MailApplicationsCollectionController.create();