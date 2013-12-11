class UserRegistrationType < UserType

  validates :password, presence: true

  permit :email, :password

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
