class MailApplication < ActiveRecord::Base
  include MailApplicationRepository

  def initialize(attributes = nil)
    super
    generate_password
  end

  has_many :mail_messages, :dependent => :destroy
  belongs_to :creator, :class_name => 'User'

  has_many :mail_application_users, :dependent => :destroy
  has_many :members, :through => :mail_application_users, :source => :user

  validates :creator, :presence => true
  validates :name, :presence => true

  state_machine :state, :initial => :active do
    state :active
    state :deleted

    event :mark_as_deleted do
      transition all => :deleted
    end

  end

  def to_s
    name
  end

  private

    def generate_password
      self.password = SecureApp.generate_string(16)
    end

end
