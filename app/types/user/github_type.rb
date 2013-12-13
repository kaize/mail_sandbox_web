class User::GithubType < User
  include ApplicationType

  has_secure_password validations: false

  validates :password, presence: true

  permit :email

  def initialize(attributes = nil)
    super(attributes)
    self.password = SecureRandom.urlsafe_base64
  end

  def email=(email)
    super(email.mb_chars.downcase) if email.present?
  end
end
