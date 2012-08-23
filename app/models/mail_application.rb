class MailApplication < ActiveRecord::Base
  include MailApplicationRepository
  attr_accessible :password, :name

  has_many :mail_messages
  belongs_to :owner, :class_name => 'User'

  after_initialize :init, :if => :new_record?

  validates :owner, :presence => true

  scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
  scope :ordered, ->{order('id DESC')}
  scope :owner_is, ->(owner){ where(:owner_id => owner.id) }

  #TODO: members
  scope :available_for, ->(user){ owner_is(user) }

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
