require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test "create feed successfull" do
    user = users(:one)
    expected_feed_count = Feed.count + 1
    feed = Feed.new({user_id: user.id, content: "bla bla"})
    feed.save

    assert_equal expected_feed_count, Feed.count
    assert_not_nil Feed.find(feed.id)
  end

  test "create feed unsuccessfull content blank" do
    user = users(:one)
    expected_feed_count = Feed.count
    feed = Feed.new({user_id: user.id})
    feed.save

    assert_equal expected_feed_count, Feed.count
  end
end
