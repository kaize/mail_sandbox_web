class MailMessageSerializer < ActiveModel::Serializer
  attributes :id, :recipient, :sender, :subject, :body,
    :state, :completed_at, :data, :mail_application

  def body
    object.utf8body
  end

  def mail_application
    object.mail_application.name
  end

  def completed_at
    I18n.l(object.completed_at, format: :full)
  end

end