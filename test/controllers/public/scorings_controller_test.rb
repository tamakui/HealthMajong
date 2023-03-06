require "test_helper"

class Public::ScoringsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_scorings_index_url
    assert_response :success
  end

  test "should get show" do
    get public_scorings_show_url
    assert_response :success
  end
end
