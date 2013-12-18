Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |c|
    c.path_prefix = configus.omniauth.path_prefix
  end

  provider :facebook, configus.auth_providers.facebook.app_id,
                      configus.auth_providers.facebook.app_secret

  provider :github, configus.auth_providers.github.app_id,
                    configus.auth_providers.github.app_secret,
                    scope: "public, user:email"

end
