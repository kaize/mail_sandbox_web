module UserPopulator
  def self.via_facebook(user, data)
    user.build_facebook do |fb|
      fb.uid = data[:uid]
      fb.nickname = data[:info][:nickname]
      fb.email = data[:info][:email]
    end

    self.set_user_credentials(user, email: data[:info][:email])
  end

  def self.via_github(user, data)
    user.build_github do |gh|
      gh.uid = data[:uid]
      gh.nickname = data[:info][:nickname]
      gh.email = data[:info][:email]
    end

    self.set_user_credentials(user, email: data[:info][:email])
  end

  private

  def self.set_user_credentials(user, options={})
    user.email = options[:email]
    user.password = SecureApp.generate_string(16)
  end

end
