# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_application, :aliases => [:application] do
    name { generate :string }
    password { generate :string }
  end
end
