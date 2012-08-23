module MailApplicationRepository
  extend ActiveSupport::Concern

  included do
    scope :web
    scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
    scope :ordered, ->{web.order('id DESC')}
  end
end
