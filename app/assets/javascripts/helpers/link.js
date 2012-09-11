MailSandboxWeb.Helpers.Link = Ember.View.extend({
  tagName: "a",
  attributeBindings: ['href'],
  hrefBinding: 'content'

});


MailSandboxWeb.Helpers.DeleteLink = MailSandboxWeb.Helpers.Link.extend({
  attributeBindings: ['href', 'dataMethod:data-method', 'confirm:data-confirm'],
  dataMethod:'delete',
  confirm: null
});
