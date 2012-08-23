# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :admin_user do
      admin {true}
    end
  end
end
