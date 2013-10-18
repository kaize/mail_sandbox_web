json.name application.name
json.settings do
  json.address           current_host
  json.port              configus.mail_application.port
  json.user_name         application.name
  json.password          application.password
end