# coding: UTF-8

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
    end
  end

  env :development, :parent => :production do
    auth_providers do
      facebook do
        app_id '198153276982373'
        app_secret '69c4bf8950cd49c27de992f3627afba8'
      end
    end
  end

  env :staging, :parent => :production do
  end
  
  env :test, :parent => :production do
  end

end
