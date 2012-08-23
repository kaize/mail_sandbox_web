class MailMessage < ActiveRecord::Base
  include MailMessageRepository

  attr_accessible :data, :recipient, :sender, :completed_at, :mail_application

  belongs_to :mail_application

  validates :mail_application, :presence => true
end
