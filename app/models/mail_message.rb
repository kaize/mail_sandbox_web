class MailMessage < ActiveRecord::Base
  include MailMessageRepository

  belongs_to :mail_application

  validates :mail_application, :presence => true

  after_create :init, :if => :new_record?

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

  ransacker :completed_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(mail_messages.completed_at)")
  end

end
