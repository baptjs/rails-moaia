require 'test_helper'

class SpottingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spottings_new_url
    assert_response :success
  end

end
