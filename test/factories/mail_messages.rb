# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_message do
    mail_application
    data { File.read("#{Rails.root}/test/fixtures/test_mail.txt") }
    recipient { generate :email }
    sender { generate :email }
    completed_at { generate :datetime }
  end
end
