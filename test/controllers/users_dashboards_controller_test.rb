require 'test_helper'

class UsersDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_dashboards_index_url
    assert_response :success
  end

  test "should get edit" do
    get users_dashboards_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_dashboards_update_url
    assert_response :success
  end

end
