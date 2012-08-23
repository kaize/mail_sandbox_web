module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ without_state(:deleted) }
    scope :ordered, ->{ web.order('id DESC') }
  end
end
