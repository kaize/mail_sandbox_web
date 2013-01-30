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
  desc "Symlinks the config yml files"
  task :symlink_config_files, :roles => :app do
    run "ln -nfs #{release_path}/config/database.sample.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/secret_keys.yml #{release_path}/config/secret_keys.yml"
    run "ln -nfs #{release_path}/config/mail_sandbox.sample.yml #{release_path}/config/mail_sandbox.yml"
  end
end
namespace :sandbox do
  desc "Restart mail sandbox"
  task :restart, :roles => :app do
    run "cd #{release_path}; bundle exec rake sandbox:restart"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_config_files'

after 'deploy:restart', 'sandbox:restart'
after "deploy:update", "deploy:cleanup"