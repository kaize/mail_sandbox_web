FactoryGirl.define do
  factory :unconfirmed_user, class: 'User' do
    email { generate :email }
    password { generate :string }
    password_confirmation { "#{password}" }
  end

  factory :admin_user, parent: :user do
    admin {true}
  end

  factory :user, parent: :unconfirmed_user do
    after(:build) do |u|
      u.confirm
    end
  end

  factory :facebook_user, parent: :user do
    after(:create) do |u|
      create "user/facebook", user: u
    end
  end

  factory :github_user, parent: :user do
    after(:create) do |u|
      create "user/github", user: u
    end
  end
end
