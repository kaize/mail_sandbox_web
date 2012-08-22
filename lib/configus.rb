# coding: UTF-8

Configus.build Rails.env do

  env :production do
    omniauth do
      path_prefix '/web/user'
    end
    auth_providers do
      facebook do
        app_id ''
        app_secret ''
      end
    end
    mail_application do
      address 'mail-sandbox.com'
      port 2525
    end
  end

  env :development, :parent => :production do
    mail_application do
      address 'localhost'
      port 2525
    end
  end

  env :staging, :parent => :production do
    mail_application do
      address 'staging.mail-sandbox.home'
      port 2525
    end
  end
  
  env :test, :parent => :production do
  end

end
