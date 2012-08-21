class MailApplication < ActiveRecord::Base
  attr_accessible :password, :user

  has_many :mail_messages
  scope :find_by_credentials, ->(user, password){ where(:user => user).where(:password => password) }

end
