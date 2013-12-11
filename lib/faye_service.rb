class FayeService
  class << self

    def mail_message_new(mail_message)
      mail_message_request(mail_message)
    end

    private

    def mail_message_request(mail_message)
      @channel  ||= CustomUrlHelpers::faye_message_new_channel_cpath
      @faye_url ||= CustomUrlHelpers::faye_curl

      message = { channel: @channel, data: MailMessageSerializer.new(mail_message, root: false) }
      uri = URI.parse(@faye_url)

      Net::HTTP.post_form(uri, message: message.to_json)
    end

  end
end