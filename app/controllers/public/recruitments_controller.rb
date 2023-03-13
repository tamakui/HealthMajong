class Public::RecruitmentsController < ApplicationController
  def new
    @recruitment = Recruitment.new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.end_user_id = current_end_user.id
    @recruitment.save
    redirect_to recruitments_path
  end
  
  def destroy
  end
  
  private
  
  def recruitment_params
    params.require(:recruitment).permit(:title, :comment)
  end
end
