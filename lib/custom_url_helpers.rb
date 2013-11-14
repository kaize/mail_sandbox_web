module CustomUrlHelpers

  def self.faye_curl
    "#{configus.host}:#{configus.faye.port}#{configus.faye.url}"
  end

  def self.faye_js_curl
    "#{faye_curl}/client.js"
  end

  def self.faye_message_new_channel_cpath
    "/message/new"
  end

end