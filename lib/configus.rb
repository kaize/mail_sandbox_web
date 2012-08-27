# coding: UTF-8

module Configus
  yaml_cfg = YAML.load_file "#{Rails.root}config/secret_keys.yml"

  FACEBOOK = yaml_cfg['facebook']
  GITHUB = yaml_cfg['github']

end

Configus.build Rails.env do

  env :production do

    omniauth do
      path_prefix '/user'
    end

    auth_providers do
      facebook do
        app_id '323420671087107'
        app_secret '86c019a1c365535e882338c9320ee2cf'
      end
      github do
        app_id 'b5dd091722ab2550f343'
        app_secret '4a2013a2665d35844a184f4703e4b5459ae423e9'
      end
    end

    mail_application do
      port 2525
    end

    pagination do
      default_per_page 10
      per_page_list [1,5,10,20,50,100]
    end

  end

  env :development, :parent => :production do
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
  end

  env :staging, :parent => :production do
  end

  env :test, :parent => :development do
  end

end
