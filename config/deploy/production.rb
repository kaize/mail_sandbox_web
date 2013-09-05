set :rails_env, :production
set :branch do
    raise "TAG must be specified, example: TAG=v2" unless ENV['TAG']
    ENV['TAG']
end

set :rvm_ruby_string, 'ruby-1.9.3-p327@mail_sandbox'

set :user, 'poweruser'

role :web, "192.168.249.187"
role :app, "192.168.249.187"
role :db,  "192.168.249.187", :primary => true

set :keep_releases, 10


namespace :sandbox do
  desc "Restart mail sandbox"
  task :restart, :roles => :app do
    run "sudo sv restart /etc/service/mail_sandbox_face"
    run "sudo sv restart /etc/service/mail_sandbox_worker"
  end
end

after 'deploy:restart', 'sandbox:restart'
