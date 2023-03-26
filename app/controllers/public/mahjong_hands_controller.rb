class Public::MahjongHandsController < ApplicationController
  before_action :authenticate_end_user!
  
  def index
    @mahjong_hands = MahjongHand.all
  end

  def show
    @mahjong_hand = MahjongHand.find(params[:id])
    @mahjong_hands = MahjongHand.all
  end
end
