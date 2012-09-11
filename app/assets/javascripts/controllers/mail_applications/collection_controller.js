MailSandboxWeb.MailApplicationsCollectionController = Ember.ArrayController.extend({

  reload_content: function(){
			var items = MailSandboxWeb.Store.findAll(MailSandboxWeb.MailApplication);
      this.set( 'content', items );
  }

});
MailSandboxWeb.Controllers.MailApplicationsCollection = MailSandboxWeb.MailApplicationsCollectionController.create();