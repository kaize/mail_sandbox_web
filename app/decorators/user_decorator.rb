class UserDecorator < ApplicationDecorator
  decorates :user

  def role
    user.admin? ? :admin : :user
  end

  def providers
    user.providers.map(&:decorate)
  end

  def to_s
    "#{user.nickname} <#{user.email}>"
  end
end
