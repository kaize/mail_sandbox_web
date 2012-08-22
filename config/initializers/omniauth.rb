Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |c|
    c.path_prefix = configus.omniauth.path_prefix
  end
end
