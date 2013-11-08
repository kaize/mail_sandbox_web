class MailApplicationSerializer < ActiveModel::Serializer

  include ApplicationHelper

  attributes :id, :name, :password, :port, :recipients, :senders, :members,
    :owner_nickname, :unread_mails_count, :current_user_can_delete_app

  def port
    configus.mail_application.port
  end

  def recipients
    recipient_list(object)
  end

  def senders
    sender_list(object)
  end

  def owner_nickname
    object.owner.nickname
  end

  def current_user_can_delete_app
    current_user.can_delete_app?(object)
  end

end