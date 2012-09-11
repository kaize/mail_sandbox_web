MailSandboxWeb.MailApplicationsCollectionView = Ember.CollectionView.extend({

//  classNames: ['table', 'table-hover', 'mail_applications'],
  tagName: 'tbody',
  contentBinding: 'controller.content',

  itemViewClass: Ember.View.extend({
    tagName: 'tr',
    templateName: 'mail_applications/mail_application',
    contextBinding: "content"
  }),

  willInsertElement: function(){
    this.get('controller').reload_content()
  }

});
