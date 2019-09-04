require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get redirected" do
    get dashboard_index_url
    assert_redirected_to '/users/sign_in'
  end

  test "should get index" do
    sign_in users(:one)
    get dashboard_index_url
    assert_response :success
  end

end
