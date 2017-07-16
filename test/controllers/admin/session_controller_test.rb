require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get details" do
    get session_details_url
    assert_response :success
  end

end
