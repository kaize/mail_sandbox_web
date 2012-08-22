class FacebookService < NetworkService
  
  def register(data)
    auth = User::Facebook.find_by_uid(data[:uid])
    if auth
      user = auth.user
      return user
    end

    user = User.new
  end
end
