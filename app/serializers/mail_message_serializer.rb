class MailMessageSerializer < ActiveModel::Serializer
  attributes :id, :recipient, :sender, :subject, :body,
    :state, :completed_at

  def body
    object.utf8body
  end

end