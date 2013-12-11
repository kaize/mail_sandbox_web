# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_application, :aliases => [:application] do
    association :creator, :factory => :user
    name { generate :string }
    password { generate :string }
  end
end
