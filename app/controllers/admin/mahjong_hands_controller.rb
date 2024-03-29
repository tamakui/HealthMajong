class Admin::MahjongHandsController < ApplicationController
  before_action :authenticate_admin!
  
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
    if @mahjong_hand.save
      flash[:notice] = "投稿が成功しました"
      redirect_to admin_mahjong_hand_path(@mahjong_hand)
    else
      flash[:notice] = "正しい入力をお願いします"
      render "new"
    end
  end
  
  def update
    @mahjong_hand = MahjongHand.find(params[:id])
    if @mahjong_hand.update(mahjong_hand_params)
      flash[:notice] = "編集が成功しました"
      redirect_to admin_mahjong_hand_path(@mahjong_hand.id)
    else
      flash[:notice] = "正しい入力をお願いします"
      render 'edit'
    end
  end
  
  def destroy
    @mahjong_hand = MahjongHand.find(params[:id])
    @mahjong_hand.destroy
    flash[:notice] = "削除が成功しました"
    redirect_to admin_mahjong_hands_path
  end
    
  
  private
  
  def mahjong_hand_params
    params.require(:mahjong_hand).permit(:name, :describe, :image, :genre_id)
  end
  
end
