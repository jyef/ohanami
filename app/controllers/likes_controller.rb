class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @heart = params[:heart]
    @review = Review.find(params[:review_id])
    current_user.favorite(@review)
  end

  def destroy
    @heart = params[:heart]
    @review = Review.find(params[:review_id])
    current_user.unfavorite(@review)
  end
end
