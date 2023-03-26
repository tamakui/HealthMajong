class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "投稿が成功しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash[:notice] = "正しい入力をお願いします"
      render 'index'
    end
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "編集が成功しました"
      redirect_to admin_genres_path
    else
      flash[:notice] = "正しい入力をお願いします"
      render 'edit'
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    @genres = Genre.all
    flash[:notice] = "削除が成功しました"
    redirect_to admin_genres_path
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
