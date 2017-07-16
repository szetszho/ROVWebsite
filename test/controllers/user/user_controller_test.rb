require 'test_helper'

class User::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_user_index_url
    assert_response :success
  end

end
