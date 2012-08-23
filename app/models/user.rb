class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :facebook, :dependent => :destroy, :autosave => true
  has_one :github, :dependent => :destroy, :autosave => true

  has_many :mail_applications, :inverse_of => :owner, :foreign_key => :owner_id

  def available_applications
    MailApplication.available_for(self)
  end

  def guest?
    false
  end
end
