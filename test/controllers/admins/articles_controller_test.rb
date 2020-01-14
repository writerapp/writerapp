require 'test_helper'

class Admins::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_articles_show_url
    assert_response :success
  end

  test "should get edit_headings" do
    get admins_articles_edit_headings_url
    assert_response :success
  end

  test "should get edit" do
    get admins_articles_edit_url
    assert_response :success
  end

end
