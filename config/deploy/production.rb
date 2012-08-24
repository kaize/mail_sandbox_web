set :rails_env, :production
set :branch do
    raise "TAG must be specified, example: TAG=v2" unless ENV['TAG']
    ENV['TAG']
end

set :user, 'mail_sandbox_web_production'

role :web, ""
role :app, ""
role :db,  "", :primary => true

set :keep_releases, 10