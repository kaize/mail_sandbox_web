class Web::MailMessagesController < ApplicationController
  def index
    @messages = MailMessage.web
  end
end
