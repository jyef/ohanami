class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def create
    @game = Game.find(params[:game_id])
    review = current_user.reviews.build(review_params)
    review.game_id = @game.id 
    if review.save
      flash[:success] = '感想を投稿しました。'
      redirect_to @game
    else
      flash.now[:danger] = '感想の投稿に失敗しました（1文字以上入力してください）。'
      render template: "games/show"
    end
  end
  
  def edit
    @review = current_user.reviews.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    @review.edited = true
    if @review.update(review_params)
      flash[:success] = "感想を更新しました。"
      if params[:referer].include?("/games/")
        redirect_to game_path(@review.game_id)
      else  
        redirect_to myreviews_user_path(@review.user_id)
      end
    else
      flash.now[:danger] = "感想は更新されませんでした（1文字以上入力してください）。"
      render :edit
    end
  end
  
  def destroy
    review = current_user.reviews.find(params[:id])
    review.destroy
    flash[:success] = '感想を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
private

  def review_params
    params.require(:review).permit(:content, :spoiler, :edited)
  end
  
  def correct_user
    reviewer = Review.find(params[:id])
    unless reviewer.user_id == session[:user_id]
      redirect_to root_url
    end
  end
end
