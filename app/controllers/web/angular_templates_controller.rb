class Web::AngularTemplatesController < Web::ApplicationController
  layout false
  def show
    render "web/angular_templates/#{params[:template]}"
  end
end