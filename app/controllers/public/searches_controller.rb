class SearchesController < ApplicationController
  before_action :authenticate_end_user!
  
  def search
    @range = params[:range]
    
    if @range == "EndUser"
      @end_users = EndUser.looks(params[:search], params[:word])
    elsif
      @mahjong_hands = MahjongHand.looks(params[:search], params[:word])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
  end
        
end
