class UserRegistrationType < User
  include ApplicationType

  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true

  permit :email, :password, :password_confirmation

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
