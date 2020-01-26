class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = Review.find(params[:review_id])
    current_user.favorite(review)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unfavorite(review)
    redirect_back(fallback_location: root_path)
  end
end
