require 'test_helper'

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_users_show_url
    assert_response :success
  end

  test "should get check" do
    get users_users_check_url
    assert_response :success
  end

  test "should get destroy" do
    get users_users_destroy_url
    assert_response :success
  end

end