MailSandboxWeb.MailApplication = DS.Model.extend({
  name: DS.attr('string'),
  unread_mails_count: DS.attr('number'),
  owner_nickname: DS.attr('string'),
  edit_link: DS.attr('string'),
  delete_link: DS.attr('string')
});