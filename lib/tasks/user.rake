namespace :user do
  desc "Set email from provider (for users w/ blank email)"
  task set_email_from_provider: :environment do
    users_with_blank_email = User.where(email: nil)

    users_with_blank_email.each do |user|
      if user.providers.any?
        provider = user.providers.first
        if provider.email?
          user.email = provider.email
          user.save
        end
      end
    end
  end
end
