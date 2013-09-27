module BaseSocialAuth
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    attr_accessible :uid

    validates :uid, presence: true, uniqueness: true
  end
end
