module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ without_state(:deleted) }
    scope :ordered, ->{ web.order('id DESC') }
    scope :unreaded, ->{ with_state(:unread) }

    scope :last_minute, -> { where('created_at >= ?', 1.minute.ago.utc) }
    scope :recent, -> { ordered.limit(20) }

    scope :uniq_by_recipients, ->{ select(:recipient).distinct }
    scope :uniq_by_senders,    ->{ select(:sender).distinct }

  end
end
