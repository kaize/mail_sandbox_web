# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_message do
    data {FactoryGirl.generate :string}
    recipient {FactoryGirl.generate :string}
    sender {FactoryGirl.generate :string}
    completed_at {FactoryGirl.generate :datetime}
  end
end
