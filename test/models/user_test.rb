require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create user successfull" do
    u = User.find_by_email('test@example.com')
    u.destroy unless u.blank?
    expected_user_count = User.count + 1
    u = User.new ({email: 'test@example.com', first_name: 'Test', password: 'test123pass', password_confirmation: 'test123pass'})
    u.save

    assert_equal expected_user_count, User.count
    assert_not_nil User.find_by_email('test@example.com')
  end

  test "create user unsuccessfull no password" do
    u = User.find_by_email('test2@example.com')
    u.destroy unless u.blank?
    expected_user_count = User.count
    u = User.new ({email: 'test2@example.com', first_name: 'Test'})
    u.save

    assert_equal expected_user_count, User.count
    assert_nil User.find_by_email('test2@example.com')
  end

  test "create user unsuccessfull email exist" do
    u = User.find_by_email('test2@example.com')
    u.destroy unless u.blank?
    expected_user_count = User.count
    u = User.new ({email: 'test2@example.com', first_name: 'Test'})
    u.save

    assert_equal expected_user_count, User.count
    assert_nil User.find_by_email('test2@example.com')
  end
end
