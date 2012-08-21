class MailApplication < ActiveRecord::Base
  attr_accessible :password, :name

  has_many :mail_messages

  scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
  scope :ordered, ->{order('id DESC')}

  def to_s
    name
  end

  def generate_password
    self.password = SecureApp.generate_string(16)
  end

end
