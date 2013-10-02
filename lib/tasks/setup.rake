namespace :sandbox do
  desc "Setup Mail Sandbox Application"
  task :setup do
    require 'fileutils'

    root = Rails.root

    %w'database secret_keys mail_sandbox'.each do |fname|
      src = "#{root}/config/#{fname}.sample.yml"
      dest = "#{root}/config/#{fname}.yml"
      FileUtils.cp(src, dest) until File.exist?(dest)
    end

  end
end
