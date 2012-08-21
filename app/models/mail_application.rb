class MailApplication < ActiveRecord::Base
  attr_accessible :password, :name

  has_many :mail_messages

  scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
  scope :ordered, ->{order('id DESC')}

  def to_s
    name
  end

  def address
    '10.40.35.81'  # the real address will be here
  end

  def port
    2525      # it will be moved to configus
  end

  def generate_password
    self.password = SecureApp.generate_string(16)
  end

end
