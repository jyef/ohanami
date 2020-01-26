class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def require_user_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
  
  def counts(review)
    @count_likes = review.likes.count
  end
end
