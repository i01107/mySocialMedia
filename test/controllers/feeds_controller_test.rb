require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @feed = feeds(:one)
  end

  test "should create feed" do
    sign_in users(:one)
    assert_difference('Feed.count') do
      post feeds_url, params: { feed: { content: @feed.content, user_id: @feed.user_id } }
    end

    assert_redirected_to authenticated_root_path
  end

  test "should update feed" do
    sign_in users(:one)
    patch feed_url(@feed), params: { feed: { content: @feed.content, user_id: @feed.user_id } }
    assert_redirected_to authenticated_root_path
  end
end
