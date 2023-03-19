class Public::RepliesController < ApplicationController
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    reply = current_end_user.replies.new(reply_params)
    reply.recruitment_id = recruitment.id
    reply.save
    redirect_to request.referer
  end
  
  def destroy
    Reply.find_by(id: params[:id], recruitment_id: params[:recruitment_id]).destroy
    redirect_to request.referer
  end
  
  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
