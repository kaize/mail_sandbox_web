MailSandboxWeb.MailApplicationsView = Ember.CollectionView.extend({
  contentBinding: 'controller.content',
//  content:[{name: '2'},{name:'1'}],
  tagName:'ul',
  template:  Ember.Handlebars.compile("{{collection}}"),
  emptyView: Ember.View.extend({
        template: Ember.Handlebars.compile("The collection is empty")
      }),
  itemViewClass: Ember.View.extend({
    templateName: 'mail_application'
  }),

  init: function(){
    this._super();
    window.app_view = this
  }

});
