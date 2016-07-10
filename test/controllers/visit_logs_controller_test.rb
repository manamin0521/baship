require 'test_helper'

class VisitLogsControllerTest < ActionController::TestCase
  setup do
    @visit_log = visit_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visit_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit_log" do
    assert_difference('VisitLog.count') do
      post :create, visit_log: { group_kind: @visit_log.group_kind, integer: @visit_log.integer, integer: @visit_log.integer, season: @visit_log.season, spot_id: @visit_log.spot_id, weather: @visit_log.weather }
    end

    assert_redirected_to visit_log_path(assigns(:visit_log))
  end

  test "should show visit_log" do
    get :show, id: @visit_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visit_log
    assert_response :success
  end

  test "should update visit_log" do
    patch :update, id: @visit_log, visit_log: { group_kind: @visit_log.group_kind, integer: @visit_log.integer, integer: @visit_log.integer, season: @visit_log.season, spot_id: @visit_log.spot_id, weather: @visit_log.weather }
    assert_redirected_to visit_log_path(assigns(:visit_log))
  end

  test "should destroy visit_log" do
    assert_difference('VisitLog.count', -1) do
      delete :destroy, id: @visit_log
    end

    assert_redirected_to visit_logs_path
  end
end
