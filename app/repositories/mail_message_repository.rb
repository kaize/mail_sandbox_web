module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ without_state(:deleted) }
    scope :ordered, ->{ web.order('id DESC') }
    scope :unreaded, ->{ with_state(:unread) }

    scope :uniq_by_recipients, ->{ select(:recipient).uniq }
    scope :uniq_by_senders,    ->{ select(:sender).uniq }

  end
end
