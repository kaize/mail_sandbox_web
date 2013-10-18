class MailMessageSerializer < ActiveModel::Serializer
  attributes :id, :recipient, :sender, :subject, :completed_at
end