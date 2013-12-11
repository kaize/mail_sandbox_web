set :rails_env, :staging
set :branch, 'staging'
set :user, 'poweruser'

role :web, "10.40.56.70"
role :app, "10.40.56.70"
role :db,  "10.40.56.70", primary: true

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p327@mail_sandbox'

set :keep_releases, 5

after 'deploy:restart', 'sandbox:restart'
