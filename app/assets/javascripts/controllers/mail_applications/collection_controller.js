MailSandboxWeb.MailApplicationsCollectionController = Ember.ArrayProxy.extend({


  init: function(){
//    this.reload_content()
  },

  reload_content: function(){
			var items = MailSandboxWeb.Store.findAll(MailSandboxWeb.MailApplication);
      this.set( 'content', items );
  }

});
MailSandboxWeb.Controllers.MailApplicationsCollection = MailSandboxWeb.MailApplicationsCollectionController.create();