require 'test_helper'

class User::CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get user_course_register_url
    assert_response :success
  end

end
