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
      flash[:notice] = "投稿が成功しました"
      redirect_to recruitments_path
    else
      flash[:notice] = "正しい入力をお願いします"
      render 'new'
    end
  end
  
  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      flash[:notice] = "修正が成功しました"
      redirect_to recruitment_path(@recruitment.id)
    else
      flash[:notice] = "正しい入力をお願いします"
      render 'edit'
    end
  end
  
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    flash[:notice] = "削除が成功しました"
    redirect_to recruitments_path
  end
  
  private
  
  def recruitment_params
    params.require(:recruitment).permit(:title, :comment)
  end
end
