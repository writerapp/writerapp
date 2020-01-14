require 'test_helper'

class Writers::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get keywords" do
    get writers_articles_keywords_url
    assert_response :success
  end

  test "should get index" do
    get writers_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get writers_articles_show_url
    assert_response :success
  end

  test "should get edit_headings" do
    get writers_articles_edit_headings_url
    assert_response :success
  end

  test "should get edit" do
    get writers_articles_edit_url
    assert_response :success
  end

end
