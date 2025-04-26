require 'test_helper'

class Api::V1::UserActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_user_activities_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_user_activities_update_url
    assert_response :success
  end

end
