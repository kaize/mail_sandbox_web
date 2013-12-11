class UserDecorator < ApplicationDecorator
  delegate_all

  def role
    admin? ? :admin : :user
  end

  def providers
    object.providers.map(&:decorate)
  end

  def nickname
    if user.providers.any?
      user.providers.first.nickname
    else
      user.email
    end
  end

  def to_s
    "#{nickname} <#{email}>"
  end
end
