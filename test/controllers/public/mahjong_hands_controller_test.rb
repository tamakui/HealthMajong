require "test_helper"

class Public::MahjongHandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_mahjong_hands_index_url
    assert_response :success
  end

  test "should get show" do
    get public_mahjong_hands_show_url
    assert_response :success
  end
end
