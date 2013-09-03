require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get login_attempt" do
    get :login_attempt
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get calendar" do
    get :calendar
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
