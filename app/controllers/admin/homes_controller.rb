class Admin::HomesController < ApplicationController
  def top
    @recruitments = Recruitment.all
  end
  
  def show
    #@recruitment = Recruitment.find(params[:id])
  end
end
