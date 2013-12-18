class User::AuthenticationDecorator < ApplicationDecorator
  decorates "user/authentication"
  delegate_all

  def to_s
    "#{provider}"
  end
end
