class MailApplicationUser < ActiveRecord::Base
  attr_accessible :mail_application_id, :user_id

  belongs_to :user
  belongs_to :mail_application
end
