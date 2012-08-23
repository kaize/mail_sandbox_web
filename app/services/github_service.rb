class GithubService < NetworkService

  def register(data)
    auth = User::Github.find_by_uid(data[:uid].to_s)
    if auth
      user = auth.user
      return user
    end

    user = User.new
    UserPopulator.via_github(user, data)
    user.save!
    user
  end
end
