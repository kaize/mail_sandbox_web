collection @applications, :root => :mail_applications
attributes :id ,:name, :unread_mails_count
node(:owner_nickname) { |m| m.owner.nickname }
