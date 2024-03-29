class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "編集が成功しました"
      redirect_to admin_end_user_path(@end_user)
    else
      flash[:notice] = "正しい入力をお願いします"
      render 'edit'
    end
  end
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :login_name, :is_deleted)
  end
  
end
