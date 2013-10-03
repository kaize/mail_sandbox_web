namespace :user do
  desc "Set email from provider (for users w/ blank email)"
  task set_email_from_provider: :environment do
    users_with_blank_email = User.where(email: nil)

    users_with_blank_email.each do |user|
      user.providers.each do |provider|
        next unless provider.email?

        user.email = provider.email
        user.password = "1"
        user.save!

        break
      end
    end
  end
end
