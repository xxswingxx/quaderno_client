require 'test_helper'

class ApplicationCredentialsControllerTest < ActionController::TestCase
  setup do
    @application_credential = application_credentials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_credentials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_credential" do
    assert_difference('ApplicationCredential.count') do
      post :create, application_credential: { client_id: @application_credential.client_id, client_secret: @application_credential.client_secret, redirect_uri: @application_credential.redirect_uri }
    end

    assert_redirected_to application_credential_path(assigns(:application_credential))
  end

  test "should show application_credential" do
    get :show, id: @application_credential
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_credential
    assert_response :success
  end

  test "should update application_credential" do
    put :update, id: @application_credential, application_credential: { client_id: @application_credential.client_id, client_secret: @application_credential.client_secret, redirect_uri: @application_credential.redirect_uri }
    assert_redirected_to application_credential_path(assigns(:application_credential))
  end

  test "should destroy application_credential" do
    assert_difference('ApplicationCredential.count', -1) do
      delete :destroy, id: @application_credential
    end

    assert_redirected_to application_credentials_path
  end
end
