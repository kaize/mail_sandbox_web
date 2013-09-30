class GithubService < SocialAuthService

  def register(data)
    auth = User::Github.find_by_uid(data[:uid].to_s)
    if auth
      self.update_information(auth, data[:info])
      user = auth.user
      return user
    end

    user = User.find_or_initialize_by_email(data[:info][:email])
    UserPopulator.via_github(user, data)
    user.save!
    user
  end
end
