require 'test_helper'

class ObjectAttributesControllerTest < ActionController::TestCase
  setup do
    @object_attribute = object_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:object_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create object_attribute" do
    assert_difference('ObjectAttribute.count') do
      post :create, :object_attribute => @object_attribute.attributes
    end

    assert_redirected_to object_attribute_path(assigns(:object_attribute))
  end

  test "should show object_attribute" do
    get :show, :id => @object_attribute.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @object_attribute.to_param
    assert_response :success
  end

  test "should update object_attribute" do
    put :update, :id => @object_attribute.to_param, :object_attribute => @object_attribute.attributes
    assert_redirected_to object_attribute_path(assigns(:object_attribute))
  end

  test "should destroy object_attribute" do
    assert_difference('ObjectAttribute.count', -1) do
      delete :destroy, :id => @object_attribute.to_param
    end

    assert_redirected_to object_attributes_path
  end
end
