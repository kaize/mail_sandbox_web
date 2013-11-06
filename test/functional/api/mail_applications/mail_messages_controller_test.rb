require 'test_helper'

class Api::MailApplications::MailMessagesControllerTest < ActionController::TestCase
  setup do
    @user = create :facebook_user
    sign_in @user

    @application = create :application, owner: @user

    @message = create :mail_message, mail_application: @application

    @params = { mail_application_id: @application.id, format: :json }
  end

  test "should get index" do
    get :index, @params

    assert_response :success
  end

  test "should get show" do
    get :show, @params.merge(id: @message.id)

    assert_response :success
  end

  test "should update patch" do
    attrs = { state_event: :mark_read }

    patch :update, @params.merge(id: @message.id, mail_message: attrs)

    @message.reload

    assert { @message.read? }
  end

  test "should batch_update patch" do
    MailMessagesUpdateWorker.stubs(:perform_async)

    attrs = { state_event: :mark_read }

    patch :batch_update, @params.merge(mail_message: attrs, ids: [@message.id])

    assert_response :no_content
  end

end
