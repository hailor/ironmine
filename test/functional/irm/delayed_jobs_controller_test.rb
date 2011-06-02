require 'test_helper'

class Irm::DelayedJobsControllerTest < ActionController::TestCase
  test "should get item_list" do
    get :item_list
    assert_response :success
  end

end
