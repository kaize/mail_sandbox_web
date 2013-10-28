class FayeService
  class << self

    def mail_message_new(mail_message)
      mail_message_request(mail_message)
    end

    private

    def mail_message_request(mail_message)
      @channel  ||= CustomUrlHelpers::faye_message_new_channel_cpath
      @faye_url ||= CustomUrlHelpers::faye_curl

      message = { channel: @channel, data: mail_message }
      uri = URI.parse(@faye_url)
      #NOTE: serialize mail_message
      Net::HTTP.post_form(uri, message: message.to_json)
    end

  end
end