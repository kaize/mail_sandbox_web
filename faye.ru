# run with: "bundle exec thin start -e production -p 9292 -R faye.ru"

require ::File.expand_path('../config/environment', __FILE__)
Faye::WebSocket.load_adapter 'thin'

app = Faye::RackAdapter.new(mount: configus.faye.url, timeout: 25)

run app
