class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :data_not_found
  rescue_from ActionController::RoutingError, with: :data_not_found
      
  private
  
  def data_not_found
    flash[:error] = "データが存在しません"
    redirect_back(fallback_location: root_path)
  end
  
end
