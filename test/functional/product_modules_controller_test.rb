require 'test_helper'

class ProductModulesControllerTest < ActionController::TestCase
  setup do
    @product_module = product_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_module" do
    assert_difference('ProductModule.count') do
      post :create, :product_module => @product_module.attributes
    end

    assert_redirected_to product_module_path(assigns(:product_module))
  end

  test "should show product_module" do
    get :show, :id => @product_module.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_module.to_param
    assert_response :success
  end

  test "should update product_module" do
    put :update, :id => @product_module.to_param, :product_module => @product_module.attributes
    assert_redirected_to product_module_path(assigns(:product_module))
  end

  test "should destroy product_module" do
    assert_difference('ProductModule.count', -1) do
      delete :destroy, :id => @product_module.to_param
    end

    assert_redirected_to product_modules_path
  end
end
