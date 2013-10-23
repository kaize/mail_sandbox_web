class MailMessageSerializer < ActiveModel::Serializer
  attributes :id, :recipient, :sender, :subject, :body,
    :state, :completed_at, :mail_application

  def body
    object.utf8body
  end

  def mail_application
    object.mail_application.name
  end

end