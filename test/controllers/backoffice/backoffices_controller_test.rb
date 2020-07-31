require 'test_helper'

class Backoffice::BackofficesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get backoffice_backoffices_home_url
    assert_response :success
  end

end
