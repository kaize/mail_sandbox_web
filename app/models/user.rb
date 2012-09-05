class User < ActiveRecord::Base
  include UserRepository
  has_one :facebook, :dependent => :destroy, :autosave => true
  has_one :github, :dependent => :destroy, :autosave => true

  has_many :mail_applications, :inverse_of => :owner, :foreign_key => :owner_id

  has_many :mail_application_users, :dependent => :destroy
  has_many :membered_applications, :through => :mail_application_users, :source => :mail_application

  def available_applications
    return MailApplication.web if admin?
    MailApplication.web.available_for self
  end

  def owned_applications
    return MailApplication.web if admin?
    mail_applications.web
  end

  def guest?
    false
  end

  def providers
    [self.facebook,
     self.github].compact
  end

  def email
    providers.first.email
  end

  def nickname
    providers.first.nickname
  end

  def can_delete_app?(app)
    #TODO: app maybe decorator
    (self.id == app.owner.id) || admin?
  end

end
