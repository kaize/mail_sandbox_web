class FacebookService < NetworkService
  
  def register(data)
    auth = User::Facebook.find_by_uid(data[:uid])
    if auth
      self.update_information(auth, data[:info])
      user = auth.user
      return user
    end

    user = User.new
    UserPopulator.via_facebook(user, data)
    user.save!
    user
  end

  protected

  def update_information(facebook_user, information)
    facebook_user.nickname = information[:nickname]
    facebook_user.email = information[:email]
    facebook_user.save!
  end
end
