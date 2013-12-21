require 'test_helper'
SimpleCov.command_name "test:functionals"

class Api::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
    sign_in @user

    @my_application = create :application, :creator => @user

    @params = { format: :json }
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

  test "should get show" do
    get :show, @params.merge(id: @my_application.id)
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for(:mail_application)
    post :create, @params.merge(mail_application: attrs)

    application = MailApplication.find_by(name: attrs[:name])

    assert { application }
  end

  test "should patch update" do
    attrs = attributes_for(:mail_application)
    patch :update, @params.merge(id: @my_application.id, mail_application: attrs)

    @my_application.reload

    application = MailApplication.find_by(name: attrs[:name])

    assert { attrs[:name] == @my_application.name }
  end


  test "should delete destroy app and its messages" do
    @message = create :mail_message, mail_application: @my_application

    delete :destroy, @params.merge(id: @my_application.id)

    application = MailApplication.find_by(id: @my_application.id)
    message = MailMessage.find_by(id: @message.id)

    assert { !application }
    assert { !message }
  end

end
