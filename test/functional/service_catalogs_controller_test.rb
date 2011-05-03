require 'test_helper'

class ServiceCatalogsControllerTest < ActionController::TestCase
  setup do
    @service_catalog = service_catalogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_catalogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_catalog" do
    assert_difference('ServiceCatalog.count') do
      post :create, :service_catalog => @service_catalog.attributes
    end

    assert_redirected_to service_catalog_path(assigns(:service_catalog))
  end

  test "should show service_catalog" do
    get :show, :id => @service_catalog.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @service_catalog.to_param
    assert_response :success
  end

  test "should update service_catalog" do
    put :update, :id => @service_catalog.to_param, :service_catalog => @service_catalog.attributes
    assert_redirected_to service_catalog_path(assigns(:service_catalog))
  end

  test "should destroy service_catalog" do
    assert_difference('ServiceCatalog.count', -1) do
      delete :destroy, :id => @service_catalog.to_param
    end

    assert_redirected_to service_catalogs_path
  end
end
