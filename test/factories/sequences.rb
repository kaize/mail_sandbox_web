FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :uid do |n|
    "#{n}" * 5
  end

  sequence :datetime do |n|
    Time.now
  end

  sequence :email do |n|
    "mail#{n}@example.com"
  end

end
