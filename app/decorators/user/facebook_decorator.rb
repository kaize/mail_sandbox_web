class User::FacebookDecorator < ::ProviderDecorator
  decorates "user/facebook"
  delegate_all
end
