require 'test_helper'

class Backoffice::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get backoffice_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get backoffice_sessions_create_url
    assert_response :success
  end

end
