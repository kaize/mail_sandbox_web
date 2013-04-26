class MailMessage < ActiveRecord::Base
  include MailMessageRepository

  attr_accessible :data, :recipient, :sender, :completed_at, :mail_application

  belongs_to :mail_application

  validates :mail_application, :presence => true

  scope :unread, -> { where(state: "unread") }
  scope :last_minute, -> { where('created_at >= ?', 1.minute.ago.utc) }

  state_machine :state, :initial => :unread do
    state :unread
    state :read
    state :deleted

    event :mark_read do
      transition :unread => :read
    end

    event :mark_as_deleted do
      transition all => :deleted
    end
  end

  def mail
    @mail ||= Mail.new(data)
  end

  def utf8body
    @body ||= mail.body.to_s.force_encoding("UTF-8")
  end

  def plain_text?
    mail.mime_type == "text/plain"
  end
  def self.last_minute_count
    last_minute.count
  end

end
