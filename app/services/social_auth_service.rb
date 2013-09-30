class SocialAuthService < NetworkService
  
  protected

  def update_information(auth_user, information)
    auth_user.nickname = information[:nickname]
    auth_user.email = information[:email]
    auth_user.save!
  end
end
