MailSandboxWeb.MailApplicationsController = Ember.ArrayProxy.extend({
  title: "MailApplications",
  init: function() {
			this._super();
			var items = MailSandboxWeb.Store.findAll(MailSandboxWeb.MailApplication);

      this.set( 'content', items );
      console.log(items);
      window.app_con = this
		}
});
