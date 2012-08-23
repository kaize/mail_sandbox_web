module UserPopulator
  def self.via_facebook(user, data)
    user.build_facebook :uid => data[:uid]
  end

  def self.via_github(user, data)
    user.build_github :uid => data[:uid].to_s
  end
end
