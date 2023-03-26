class Public::RecruitmentsController < ApplicationController
  def new
    @recruitment = Recruitment.new
  end

  def index
    @recruitments = Recruitment.all
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @reply = Reply.new
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end
  
  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.end_user_id = current_end_user.id
    if @recruitment.save
      redirect_to recruitments_path
    else
      render 'new'
    end
  end
  
  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(@recruitment.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path
  end
  
  private
  
  def recruitment_params
    params.require(:recruitment).permit(:title, :comment)
  end
end
