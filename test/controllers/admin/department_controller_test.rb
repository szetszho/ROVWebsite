require 'test_helper'

class DepartmentControllerTest < ActionDispatch::IntegrationTest
  test "should get insert" do
    get department_insert_url
    assert_response :success
  end

  test "should get update" do
    get department_update_url
    assert_response :success
  end

end
