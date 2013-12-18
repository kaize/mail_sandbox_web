class User < ActiveRecord::Base
  include UserRepository

  has_secure_password validations: false

  validates :email, presence: true, email: true, uniqueness: true, length: {maximum: 255}
  validates :password, presence: true, on: :create

  has_many :authentications, dependent: :destroy

  has_many :mail_applications, :inverse_of => :creator, :foreign_key => :creator_id
  has_many :mail_messages, through: :mail_applications

  has_many :mail_application_users, :dependent => :destroy
  has_many :membered_applications, :through => :mail_application_users, :source => :mail_application
  has_many :membered_applications_mail_messages, through: :membered_applications, source: :mail_messages

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active
    state :hidden

    event :confirm do
      transition [:waiting_confirmation, :inactive] => :active
    end

    event :deactivate do
      transition [:waiting_confirmation, :active] => :inactive
    end

    event :hide do
      transition [:waiting_confirmation, :active, :inactive] => :hidden
    end

  end

  def available_applications
    return MailApplication.web if admin?
    MailApplication.web.available_for self
  end

  def owned_applications
    return MailApplication.web if admin?
    mail_applications.web
  end

  def available_applications_messages
    return MailMessage.web if admin?
    MailMessage.web.where(:mail_application_id => available_applications)
  end

  def generate_confirmation_token
    self.confirmation_token = SecureApp.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureApp.generate_token
  end

  def can_reset_password?
    active?
  end

  def guest?
    false
  end

  def providers
    self.authentications.compact
  end

  def can_delete_app?(app)
    #TODO: app maybe decorator
    (self.id == app.creator.id) || admin?
  end

end
