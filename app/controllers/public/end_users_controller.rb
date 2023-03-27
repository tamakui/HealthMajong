class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_guest_user, only: [:edit, :update]
  
  def index
    @end_users = EndUser.all
  end
  
  def show
    @end_user = EndUser.find(params[:id])
  end
  
  def my_page
    @end_user = current_end_user
    render :show
  end

  def edit
    @end_user = current_end_user
  end
  
  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      flash[:notice] = "編集が成功しました"
      redirect_to end_users_my_page_path
    else
      flash[:notice] = "正しい入力をしてください"
      render 'edit'
    end
  end
  
  def unsubscribe
    @end_user = current_end_user
  end
  
  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が成功しました"
    redirect_to root_path
  end
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :login_name, :profile_image, :introduction, :is_deleted)
  end
  
  def ensure_guest_user
    @user = EndUser.find_by(id: params[:id])
    if !@user || current_end_user.email == "test@test.com" || @user != current_end_user
      redirect_to root_path
    end
  end  
end