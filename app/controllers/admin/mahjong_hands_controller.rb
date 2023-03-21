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
    @mahjong_hand = MahjongHand.find(params[:id])
  end
  
  def create
    @mahjong_hand = MahjongHand.new(mahjong_hand_params)
    @mahjong_hand.save
    redirect_to admin_mahjong_hand_path(@mahjong_hand)
  end
  
  def update
    @mahjong_hand = MahjongHand.find(params[:id])
    if @mahjong_hand.update(mahjong_hand_params)
      redirect_to admin_mahjong_hand_path(@mahjong_hand.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @mahjong_hand = MahjongHand.find(params[:id])
    @mahjong_hand.destroy
    redirect_to admin_mahjong_hands_path
  end
    
  
  private
  
  def mahjong_hand_params
    params.require(:mahjong_hand).permit(:name, :describe, :image, :genre_id)
  end
end
