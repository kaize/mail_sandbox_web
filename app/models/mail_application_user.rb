class MailApplicationUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :mail_application
end
