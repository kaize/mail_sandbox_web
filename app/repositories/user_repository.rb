module UserRepository
  extend ActiveSupport::Concern
  
  included do
    scope :active, ->{}
  end
end
