module MailApplicationRepository
  extend ActiveSupport::Concern

  included do
    scope :active, where(state: 'active')
    scope :web, active
    scope :by_credentials, ->(n, p){ where{ (name.eq n) & (password.eq p)} }

    scope :ordered, ->{ web.order(completed_at: :desc) }

    scope :creator_is, ->(creator) { where(creator: creator) }
    scope :available_for, ->(user){ where{ ( creator_id == user.id ) | ( id >> user.membered_application_ids ) } }

    scope :recently_active, ->(count = 10) { where("last_message_at IS NOT NULL").order(last_message_at: :desc).limit(count) }
  end

end
