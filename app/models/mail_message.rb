class MailMessage < ActiveRecord::Base
  include MailMessageRepository

  attr_accessible :data, :recipient, :sender, :completed_at, :mail_application

  belongs_to :mail_application

  validates :mail_application, :presence => true

  state_machine :state, :initial => :unread do
    state :unread
    state :read
    state :deleted

    event :mark_read do
      transition :unread => :read
    end

    event :hide do
      transition all => :deleted
    end
  end

end
