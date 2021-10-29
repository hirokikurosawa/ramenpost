require 'test_helper'

class Users::HoemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_hoems_top_url
    assert_response :success
  end

  test "should get about" do
    get users_hoems_about_url
    assert_response :success
  end

end
