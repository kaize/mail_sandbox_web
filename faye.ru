require ::File.expand_path('../config/environment', __FILE__)

Faye::WebSocket.load_adapter 'thin'

app = Faye::RackAdapter.new(:mount => configus.faye_url, :timeout => 25)

run app