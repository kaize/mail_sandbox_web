class UserRegistrationType < UserType

  validates :password, presence: true

  attr_accessible :email, :password
  permit :email, :password

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
