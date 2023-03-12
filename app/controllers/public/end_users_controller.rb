class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  
  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end
  
  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_users_my_page_path
    else
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
    redirect_to root_path
  end
  
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  private
  
  def end_user_params
    prams.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :login_name, :profile_image, :is_deleted)
  end
  
end
