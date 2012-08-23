class MailApplication < ActiveRecord::Base
  include MailApplicationRepository
  attr_accessible :password, :name

  has_many :mail_messages
  belongs_to :owner, :class_name => 'User'

  has_many :mail_application_users
  has_many :members, :through => :mail_application_users, :source => :user

  after_initialize :init, :if => :new_record?

  validates :owner, :presence => true

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
