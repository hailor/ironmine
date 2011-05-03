require 'test_helper'

class ServiceAgreementsControllerTest < ActionController::TestCase
  setup do
    @service_agreement = service_agreements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_agreements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_agreement" do
    assert_difference('ServiceAgreement.count') do
      post :create, :service_agreement => @service_agreement.attributes
    end

    assert_redirected_to service_agreement_path(assigns(:service_agreement))
  end

  test "should show service_agreement" do
    get :show, :id => @service_agreement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @service_agreement.to_param
    assert_response :success
  end

  test "should update service_agreement" do
    put :update, :id => @service_agreement.to_param, :service_agreement => @service_agreement.attributes
    assert_redirected_to service_agreement_path(assigns(:service_agreement))
  end

  test "should destroy service_agreement" do
    assert_difference('ServiceAgreement.count', -1) do
      delete :destroy, :id => @service_agreement.to_param
    end

    assert_redirected_to service_agreements_path
  end
end
