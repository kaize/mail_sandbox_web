MailSandboxWeb.MailApplicationsCollectionView = Ember.CollectionView.extend({
  tagName: 'table',
  contentBinding: 'controller.content',
  itemViewClass: Ember.View.extend({
    tagName: 'tr',
    templateName: 'mail_applications/mail_application'
  }),

  init: function(){
    this._super();
    window.collection_view = this
  }

});
