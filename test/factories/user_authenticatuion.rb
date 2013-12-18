FactoryGirl.define do
  factory 'user/authentication', class: 'User::Authentication' do
    uid
    nickname { generate :string }
  end

  factory 'user/facebook', parent: 'user/authentication' do
    provider "facebook"
  end

  factory 'user/github', parent: 'user/authentication' do
    provider "github"
  end
end
