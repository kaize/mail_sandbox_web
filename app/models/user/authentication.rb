class User::Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true, uniqueness: {scope: 'provider'}
end
