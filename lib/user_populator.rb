module UserPopulator
  def self.via_facebook(user, data)
    user.build_facebook do |fb|
      fb.uid = data[:uid]
      fb.nickname = data[:info][:nickname]
    end
  end

  def self.via_github(user, data)
    user.build_github do |gh|
      gh.uid = data[:uid]
      gh.nickname = data[:info][:nickname]
    end
  end
end
