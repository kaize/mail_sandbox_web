class MailApplication < ActiveRecord::Base
  attr_accessible :password, :name

  has_many :mail_messages
  scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }

end
