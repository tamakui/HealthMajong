class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @recruitments = Recruitment.all
  end
  
  def show
    @recruitment = Recruitment.find(params[:recruitment_id])
    
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    flash[:notice] = "削除が成功しました"
    redirect_to admin_top_path
  end
  
end
