class Admin::MahjongHandsController < ApplicationController
  def new
    @mahjong_hand = MahjongHand.new
  end

  def index
    @mahjong_hand = MahjongHand.new
    @mahjong_hands = MahjongHand.all
  end

  def show
    @mahjong_hand = MahjongHand.find(params[:id])
  end

  def edit
    @mahjong_hand = MahjongHand.fin(params[:id])
  end
end
