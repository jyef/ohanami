class GamesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :edit]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  def new
    @game = Game.new
    @game.updates.build
  end
  
  def create
    @game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = 'ゲーム情報を投稿ました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ゲームの投稿に失敗しました。'
      render 'games/new'
    end
  end
  
  def edit
    @game = Game.find(params[:id])
    @game.updates.build
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(update_game_params)
      flash[:success] = "#{@game.title}を更新しました。"
      redirect_to @game
    else
      flash.now[:danger] = "#{@game.title}は更新されませんでした。"
      render :edit
    end
  end
  
  def destroy
  end
  
private
  
  def game_params
    params.require(:game).permit(:title, :url, :icon, :genre, :information, :play_time, :intro_image1, :intro_image2, :intro_image3, :intro_image4, :remove_icon, :remove_intro_image1, :remove_intro_image2, :remove_intro_image3, :remove_intro_image4, updates_attributes:[:update_day, :update_info])
  end
  
  def update_game_params
    params.require(:game).permit(:title, :url, :icon, :genre, :information, :play_time, :intro_image1, :intro_image2, :intro_image3, :intro_image4,:remove_icon, :remove_intro_image1, :remove_intro_image2, :remove_intro_image3, :remove_intro_image4, updates_attributes:[:update_day, :update_info, :_destroy, :id])
  end
  
  def correct_user
    game_user = Game.find(params[:id])
    unless game_user.user.id == session[:user_id]
      redirect_to root_url
    end
  end
end
