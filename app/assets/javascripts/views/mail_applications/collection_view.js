MailSandboxWeb.MailApplicationsCollectionView = Ember.CollectionView.extend({

  tagName: 'table',
  contentBinding: 'controller.content',

  itemViewClass: Ember.View.extend({
    tagName: 'tr',
    templateName: 'mail_applications/mail_application'
  }),

  willInsertElement: function(){
    this.get('controller').reload_content()
  }

});
