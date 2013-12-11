set :rails_env, :staging
set :branch, 'staging'
set :user, 'poweruser'

role :web, "10.40.56.70"
role :app, "10.40.56.70"
role :db,  "10.40.56.70", primary: true

set :undev_ruby_version, '2.0.0-p247'

set :keep_releases, 5

after 'deploy:restart', 'sandbox:restart'
