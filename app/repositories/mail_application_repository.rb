module MailApplicationRepository
  extend ActiveSupport::Concern

  included do
    scope :is_active, where(:state => 'active')
    scope :web, is_active
    scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
    scope :ordered, ->{ web.order('id DESC') }
    scope :owner_is, ->(owner){ where(:owner_id => owner.id) }
    scope :available_for, ->(user){ where{ ( owner_id == user.id ) | ( id >> user.membered_application_ids ) } }
  end

end
