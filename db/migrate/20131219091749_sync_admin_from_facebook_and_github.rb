class SyncAdminFromFacebookAndGithub < ActiveRecord::Migration
  class ::User::Github < ActiveRecord::Base
    belongs_to :user
  end
  class ::User::Facebook < ActiveRecord::Base
    belongs_to :user
  end
  class ::User::Authentication < ActiveRecord::Base
  end
  class ::User < ActiveRecord::Base
  end
  def up
    ::User::Facebook.find_each do |fb|
      fb_user = fb.user
      user = ::User.find_by(email: fb.email) if fb.email?
      if user && user != fb_user
        user.admin ||= fb_user.admin
        user.save!
      end
    end
    ::User::Github.find_each do |gh|
      gh_user = gh.user
      user = ::User.find_by(email: gh.email) if gh.email?
      if user && user != gh_user
        user.admin ||= gh_user.admin
        user.save!
      end
    end
  end
  def down
  end
end
