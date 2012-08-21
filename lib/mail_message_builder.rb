class MailMessageBuilder

  def self.build(params)

    new_params = {
      :data => params[:data],
      :recipient => params[:recipient],
      :sender => params[:sender],
      :completed_at => params[:completed_at]
    }

    MailMessage.new(new_params)

  end

end