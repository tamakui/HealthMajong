class Admin::RepliesController < ApplicationController

  def destroy
    Reply.find(params[:id]).destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to request.referer
  end
  
  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
