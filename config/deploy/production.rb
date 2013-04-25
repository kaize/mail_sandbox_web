set :rails_env, :production
set :branch do
    raise "TAG must be specified, example: TAG=v2" unless ENV['TAG']
    ENV['TAG']
end

set :repository, "gitorious@git.undev.cc:infrastructure/mailsandbox.git"

set :user, 'poweruser'

role :web, "192.168.249.187"
role :app, "192.168.249.187"
role :db,  "192.168.249.187", :primary => true

set :keep_releases, 10