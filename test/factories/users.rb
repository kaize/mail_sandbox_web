# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:facebook_user] do
    facebook :factory => "user/facebook"
    email { generate :email }
    password { generate :string }
    password_confirmation { "#{password}" }
  end

  factory :admin_user, :parent => :user do
    admin {true}
  end

  factory :github_user, :parent => :user do
    github :factory => "user/github"
  end
end
