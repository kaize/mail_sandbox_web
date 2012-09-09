MailSandboxWeb.MailApplicationsView = Ember.CollectionView.extend({
  tagName:'ul',
  itemViewClass: Ember.View.extend({
    templateName: 'mail_application'
  })

});
