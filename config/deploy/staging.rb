set :rails_env, :staging
set :branch, 'staging'

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p327@mail_sandbox'

set :user, 'mail_sandbox_web_staging'

role :web, "10.40.35.81"
role :app, "10.40.35.81"
role :db,  "10.40.35.81", :primary => true

set :keep_releases, 5