class MigrateDataFromUserGithubToUserAuthentications < ActiveRecord::Migration
  class ::User::Github < ActiveRecord::Base
    belongs_to :user
  end
  class ::User::Authentication < ActiveRecord::Base
  end
  class ::User < ActiveRecord::Base
  end
  def up
    ::User::Github.find_each do |gh|
      auth = ::User::Authentication.where(provider: 'github',
        uid: gh.uid).first_or_initialize(nickname: gh.nickname)

      unless auth.persisted?
        gh_user = gh.user
        user = ::User.find_by(email: gh.email) if gh.email?
        if user && user != gh_user
          user.mail_applications << gh_user.mail_applications
          user.membered_applications << gh_user.membered_applications
          user.admin ||= gh_user.admin
          user.authentications << auth
          gh_user.hide
        else
          gh_user.email = gh.email
          gh_user.authentications << auth
        end
        gh_user.save
      end
    end
  end
  def down
    ::User::Authentication.where(provider: 'github').destroy_all
  end
end
