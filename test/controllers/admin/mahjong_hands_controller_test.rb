require "test_helper"

class Admin::MahjongHandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_mahjong_hands_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_mahjong_hands_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_mahjong_hands_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_mahjong_hands_edit_url
    assert_response :success
  end
end
