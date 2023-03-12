class Public::MahjongHandsController < ApplicationController
  def index
    @mahjong_hands = MahjongHand.all
  end

  def show
    @mahjong_hand = MahjongHand.find(params[:id])
    @mahjong_hands = MahjongHand.all
  end
end
