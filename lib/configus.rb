# coding: UTF-8

module Configus
  secret_keys_path = "#{Rails.root}config/secret_keys.yml"
  # load sample file if not exist for 'rake sandbox:setup'
  secret_keys_path = "#{Rails.root}config/secret_keys.sample.yml" unless File.exist?(secret_keys_path)

  yaml_cfg = YAML.load_file(secret_keys_path)[Rails.env.to_s]

  FACEBOOK = yaml_cfg['facebook']
  GITHUB = yaml_cfg['github']
  AIRBRAKE = yaml_cfg['airbrake']

end

Configus.build Rails.env do

  env :production do

    airbrake do
      enable? true
      api_key Configus::AIRBRAKE['api_key']
      host Configus::AIRBRAKE['host']
    end

    omniauth do
      path_prefix '/user'
    end

    auth_providers do
      facebook do
        app_id Configus::FACEBOOK['app_id']
        app_secret Configus::FACEBOOK['app_secret']
      end
      github do
        app_id Configus::GITHUB['app_id']
        app_secret Configus::GITHUB['app_secret']
      end
    end

    mail_application do
      port 2525
    end

    pagination do
      default_per_page 10
      per_page_list [5,10,20,50,100]
    end

  end

  env :development, :parent => :production do
  end

  env :staging, :parent => :production do
  end

  env :test, :parent => :development do
  end

end
