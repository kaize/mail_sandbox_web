class MigrateDataFromUserFacebookToUserAuthentications < ActiveRecord::Migration
  class ::User::Facebook < ActiveRecord::Base
    belongs_to :user
  end
  class ::User::Authentication < ActiveRecord::Base
  end
  class ::User < ActiveRecord::Base
  end
  def up
    ::User::Facebook.find_each do |fb|
      auth = ::User::Authentication.where(provider: 'facebook',
        uid: fb.uid).first_or_initialize(nickname: fb.nickname)

      unless auth.persisted?
        fb_user = fb.user
        user = ::User.find_by(email: fb.email) if fb.email?
        if user && user != fb_user
          user.mail_applications << fb_user.mail_applications
          user.membered_applications << fb_user.membered_applications
          user.admin ||= fb_user.admin
          user.authentications << auth
          fb_user.hide
        else
          fb_user.email = fb.email
          fb_user.authentications << auth
        end
        fb_user.save!
      end
    end
  end
  def down
    ::User::Authentication.where(provider: 'facebook').destroy_all
  end
end
