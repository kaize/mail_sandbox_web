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
  end

  env :development, :parent => :production do
  end

  env :staging, :parent => :production do
  end
  
  env :test, :parent => :production do
  end

end
