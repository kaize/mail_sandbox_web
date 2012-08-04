FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :datetime do |n|
    Time.now
  end

end
