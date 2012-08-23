# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'user/github', :class => 'User::Github' do
    user
    uid { generate(:uid) }
  end
end
