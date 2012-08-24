class UserDecorator < Draper::Base
  decorates :user

  include Draper::LazyHelpers

  def role
    user.admin? ? :admin : :user
  end

  def providers
    user.providers.map(&:decorate)
  end
  
  def to_s
    user
  end
end
