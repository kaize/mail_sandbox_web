module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ without_state(:deleted) }
    scope :ordered, ->{ web.order(completed_at: :desc) }
    scope :unreaded, ->{ with_state(:unread) }

    scope :last_minute, -> { where('created_at >= ?', 1.minute.ago.utc) }
    scope :recent, ->(count = 10) { ordered.limit(count) }

    scope :uniq_by_recipients, ->{ select(:recipient).distinct }
    scope :uniq_by_senders,    ->{ select(:sender).distinct }

    scope :by_user, ->(user) {
      joins{mail_application.members}
        .where{(mail_application.members.id.eq user.id) | (mail_application.creator_id.eq user.id)}
    }
    scope :recent_by_user, ->(user) { by_user(user).recent }
  end
end
