class Admin::HomesController < ApplicationController
  def top
    @recruitments = Recruitment.all
  end
  
  def show
    @recruitment = Recruitment.find(params[:recruitment_id])
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:recruitment_id])
    @recruitment.destroy(recruitment_params)
    redirect_to admin_home_path(@recruitment)
  end
    
  private
  
  def recruitment_params
    params.require(:recruitment).permit(:title, :comment, :end_user_id, :image)
  end
  
end
