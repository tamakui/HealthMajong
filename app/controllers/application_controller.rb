class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, ActionView::MissingTemplate, ActiveRecord::RecordNotFound, with: :data_not_found

  def data_not_found
    flash[:error] = "データが存在しません"
    redirect_back(fallback_location: root_path)
  end
  
end
