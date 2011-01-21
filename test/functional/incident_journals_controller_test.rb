require 'test_helper'

class IncidentJournalsControllerTest < ActionController::TestCase
  setup do
    @incident_journal = incident_journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident_journal" do
    assert_difference('IncidentJournal.count') do
      post :create, :incident_journal => @incident_journal.attributes
    end

    assert_redirected_to incident_journal_path(assigns(:incident_journal))
  end

  test "should show incident_journal" do
    get :show, :id => @incident_journal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @incident_journal.to_param
    assert_response :success
  end

  test "should update incident_journal" do
    put :update, :id => @incident_journal.to_param, :incident_journal => @incident_journal.attributes
    assert_redirected_to incident_journal_path(assigns(:incident_journal))
  end

  test "should destroy incident_journal" do
    assert_difference('IncidentJournal.count', -1) do
      delete :destroy, :id => @incident_journal.to_param
    end

    assert_redirected_to incident_journals_path
  end
end
