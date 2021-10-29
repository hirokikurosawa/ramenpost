require 'test_helper'

class Users::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_likes_index_url
    assert_response :success
  end

  test "should get creat" do
    get users_likes_creat_url
    assert_response :success
  end

  test "should get destroy" do
    get users_likes_destroy_url
    assert_response :success
  end

end
