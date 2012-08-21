# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_message do
    mail_application
    data { generate :string }
    recipient { generate :string }
    sender { generate :string }
    completed_at { generate :datetime }
  end
end
