class FacebookService < SocialAuthService
  
  def register(data)
    auth = User::Facebook.find_by_uid(data[:uid])
    if auth
      self.update_information(auth, data[:info])
      user = auth.user
      return user
    end

    user = User.find_or_initialize_by_email(data[:info][:email])
    UserPopulator.via_facebook(user, data)
    user.save!
    user.confirm if user.waiting_confirmation?
    user
  end

end
