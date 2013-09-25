module MailApplicationRepository
  extend ActiveSupport::Concern

  included do
    scope :active, where(:state => 'active')
    scope :web, active
    scope :by_credentials, ->(n, p){ where{ (name.eq n) & (password.eq p)} }
    scope :ordered, ->{ web.order('id DESC') }
    scope :owner_is, ->(owner){ where(:owner_id => owner.id) }
    scope :available_for, ->(user){ where{ ( owner_id == user.id ) | ( id >> user.membered_application_ids ) } }
  end

end
