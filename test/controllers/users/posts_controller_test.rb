require 'test_helper'

class Users::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get users_posts_new_url
    assert_response :success
  end

  test "should get creat" do
    get users_posts_creat_url
    assert_response :success
  end

  test "should get show" do
    get users_posts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get users_posts_destroy_url
    assert_response :success
  end

  test "should get following_posts" do
    get users_posts_following_posts_url
    assert_response :success
  end

  test "should get search" do
    get users_posts_search_url
    assert_response :success
  end

end
