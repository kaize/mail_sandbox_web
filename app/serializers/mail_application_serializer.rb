class MailApplicationSerializer < ActiveModel::Serializer

  include ApplicationHelper

  attributes :id, :name, :password, :smtp_settings, :recipients, :senders, :members,
    :creator_nickname, :unread_mails_count, :current_user_can_delete_app

  def smtp_settings
    { host: configus.host, port: configus.mail_application.port }
  end

  def recipients
    recipient_list(object)
  end

  def senders
    sender_list(object)
  end

  def creator_nickname
    object.creator.nickname
  end

  def current_user_can_delete_app
    current_user.can_delete_app?(object)
  end

end