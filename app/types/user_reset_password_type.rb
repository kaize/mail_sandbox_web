class UserResetPasswordType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String

  validates :email, presence: true, email: true

  validate :check_banned_user, if: :email
  validate :check_new_user, if: :email

  def user
    ::User.where(email: email.mb_chars.downcase).first
  end

  private

  def check_banned_user
    if user.try(:inactive?)
      errors.add(:email, :user_inactive)
    end
  end

  def check_new_user
    if user.try(:waiting_confirmation?)
      errors.add(:email, :user_new)
    end
  end

end
