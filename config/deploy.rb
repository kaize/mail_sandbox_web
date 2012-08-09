set :rake, "#{rake} --trace"

set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "mail_sandbox_web"

set :rvm_type, :system

set :use_sudo, false
set :ssh_options, :forward_agent => true
default_run_options[:pty] = true

set :scm, :git
set :repository, "git@github.com:kaize/mail_sandbox_web.git"

namespace :deploy do

  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{release_path}/config/database.sample.yml #{release_path}/config/database.yml"
  end

end

before 'deploy:finalize_update', 'deploy:symlink_db'

after 'deploy:restart', 'unicorn:restart'
after "deploy:update", "deploy:cleanup"