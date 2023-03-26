class Public::RepliesController < ApplicationController
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    reply = current_end_user.replies.new(reply_params)
    reply.recruitment_id = recruitment.id
    if reply.save
      flash[:notice] = "投稿が成功しました"
      redirect_to request.referer
    else
      flash[:notice] = "正しい入力をお願いします"
      redirect_to request.referer
    end
  end
  
  def destroy
    Reply.find_by(id: params[:id], recruitment_id: params[:recruitment_id]).destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to request.referer
  end
  
  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
