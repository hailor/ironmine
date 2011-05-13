require 'test_helper'

class WfFieldUpdatesControllerTest < ActionController::TestCase
  setup do
    @wf_field_update = wf_field_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_field_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_field_update" do
    assert_difference('WfFieldUpdate.count') do
      post :create, :wf_field_update => @wf_field_update.attributes
    end

    assert_redirected_to wf_field_update_path(assigns(:wf_field_update))
  end

  test "should show wf_field_update" do
    get :show, :id => @wf_field_update.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_field_update.to_param
    assert_response :success
  end

  test "should update wf_field_update" do
    put :update, :id => @wf_field_update.to_param, :wf_field_update => @wf_field_update.attributes
    assert_redirected_to wf_field_update_path(assigns(:wf_field_update))
  end

  test "should destroy wf_field_update" do
    assert_difference('WfFieldUpdate.count', -1) do
      delete :destroy, :id => @wf_field_update.to_param
    end

    assert_redirected_to wf_field_updates_path
  end
end
