set :rails_env, :staging
set :branch, 'staging'

set :user, 'mail_sandbox_web_staging'

role :web, "10.40.35.81"
role :app, "10.40.35.81"
role :db,  "10.40.35.81", :primary => true

set :keep_releases, 5