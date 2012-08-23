class Api::ApplicationController < ApplicationController
  respond_to :json

  def respond_render(respond)
    status = respond[:success] ? :ok : :unprocessable_entity
    render :json => respond[:body], :status => status
  end

end
