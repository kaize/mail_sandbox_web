class User::GithubDecorator < ::ProviderDecorator
  decorates "user/github"
  delegate_all
end
