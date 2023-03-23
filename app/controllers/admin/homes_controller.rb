class Admin::HomesController < ApplicationController
  def top
    @recruitments = Recruitment.all
  end
  
  def show
    @recruitment = Recruitment.find(params[:recruitment_id])
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to admin_top_path
  end
  
end
