collection @applications, :root => :mail_applications
attributes :id ,:name, :unread_mails_count
node(:owner_nickname) { |app| app.owner.nickname }
node(:edit_link) { |app| edit_mail_application_path(app) }
node(:delete_link, :if => lambda { |app| current_user.can_delete_app?(app) }) { |app| edit_mail_application_path(app) }

