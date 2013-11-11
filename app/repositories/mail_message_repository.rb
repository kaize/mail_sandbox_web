module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ without_state(:deleted) }
    scope :ordered, ->{ web.order('completed_at DESC') }
    scope :unreaded, ->{ with_state(:unread) }

    scope :last_minute, -> { where('created_at >= ?', 1.minute.ago.utc) }
    scope :recent, ->(count = 10) { ordered.limit(count) }

    scope :uniq_by_recipients, ->{ select(:recipient).distinct }
    scope :uniq_by_senders,    ->{ select(:sender).distinct }

  end
end
