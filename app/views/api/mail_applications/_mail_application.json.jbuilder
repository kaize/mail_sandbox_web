json.name application.name
json.settings do
  json.address           current_host
  json.port              configus.mail_application.port
  json.user_name         application.name
  json.password          application.password
end
if messages
  json.mail_messages messages do |m|
    json.id            m.id
    json.recipient     m.recipient
    json.sender        m.sender
    json.mail_subject  m.subject
    json.completed_at  m.completed_at
  end
end