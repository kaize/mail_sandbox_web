# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'user/facebook', :class => 'User::Facebook' do
    uid { generate(:uid) }
    nickname { generate(:string) }
    email { generate(:email) }
  end
end
