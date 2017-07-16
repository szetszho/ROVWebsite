require 'test_helper'

class Admin::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admin_authentication_login_url
    assert_response :success
  end

end
