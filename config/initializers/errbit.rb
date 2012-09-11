if configus.airbrake.enable?
  Airbrake.configure do |config|
    config.api_key		= configus.airbrake.api_key
    config.host				= configus.airbrake.host
    config.port				= 80
    config.secure			= config.port == 443
  end
end
