class MailApplication < ActiveRecord::Base
  include MailApplicationRepository

  attr_accessible :password, :name

  has_many :mail_messages

  after_initialize :init, :if => :new_record?

  def init
    generate_password
  end

  def to_s
    name
  end

  def generate_password
    self.password = SecureApp.generate_string(16)
  end

end
