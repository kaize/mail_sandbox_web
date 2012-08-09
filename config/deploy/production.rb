set :rails_env, :production
set :branch, 'master'

set :user, 'mail_sandbox_web_production'

role :web, ""
role :app, ""
role :db,  "", :primary => true

set :keep_releases, 10