class MailMessagesUpdateWorker
  include Sidekiq::Worker

  def perform(params)
    params_from_redis = ApplicationType::params_from_redis(params)

    resource_application = MailApplication.find(params_from_redis["mail_application_id"])

    messages = resource_application.mail_messages.where(id: params_from_redis["ids"]).find_each do |message|
      message = message.becomes(MailMessageType)

      message.update(params_from_redis["mail_message"])
    end
  end

end

