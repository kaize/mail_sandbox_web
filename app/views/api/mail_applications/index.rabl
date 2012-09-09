collection @applications, :root => :mail_applications
attributes :id ,:name, :unread_mails_count
node(:owner_nickname) { |m| m.owner.nickname }
node(:edit_link) { |m| edit_mail_application_path(m) }
