module UserRepository
  extend ActiveSupport::Concern
  
  included do
    scope :web, ->{ without_state :hidden }
    scope :active, ->{ web }
  end
end
