module BaseSocialAuth
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    validates :uid, presence: true, uniqueness: true
  end
end
