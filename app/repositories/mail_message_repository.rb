module MailMessageRepository
  extend ActiveSupport::Concern

  included do
    scope :web
    scope :ordered, ->{web.order('id DESC')}
  end
end
