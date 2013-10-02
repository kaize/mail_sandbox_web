class UserDecorator < ApplicationDecorator
  decorates :user

  def role
    user.admin? ? :admin : :user
  end

  def providers
    user.providers.map(&:decorate)
  end

  def nickname
    if user.providers.any?
      user.providers.first.nickname
    else
      user.email
    end
  end

  def to_s
    "#{nickname} <#{user.email}>"
  end
end
