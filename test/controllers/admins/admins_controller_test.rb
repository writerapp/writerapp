require 'test_helper'

class Admins::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admins_admins_top_url
    assert_response :success
  end

end
