json.id application.id
json.name application.name

json.settings do
  json.address           current_host
  json.port              configus.mail_application.port
  json.user_name         application.name
  json.password          application.password
end

json.recipients  recipient_list(application)
json.senders     sender_list(application)
json.members     application.members

json.owner_nickname               application.owner.nickname
json.unread_mails_count           application.unread_mails_count
json.current_user_can_delete_app  current_user.can_delete_app?(application)