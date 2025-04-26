require 'test_helper'

class Api::V1::UserProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_user_programs_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_user_programs_create_url
    assert_response :success
  end

end
