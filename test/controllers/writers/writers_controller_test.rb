require 'test_helper'

class Writers::WritersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get writers_writers_show_url
    assert_response :success
  end

end
