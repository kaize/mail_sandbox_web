class FacebookService < NetworkService
  
  def register(data)
    Rails.logger.debug "UID: #{data[:uid]}"
    auth = User::Facebook.find_by_uid(data[:uid])
    if auth
      user = auth.user
      return user
    end

    user = User.new
    UserPopulator.via_facebook(user, data)
    user.save!
    user
  end
end
