class ToppagesController < ApplicationController
  def index
    @reviews = Review.limit(10).order("created_at DESC")
    
    if params[:title].present?
      @games = Game.where('title LIKE ?', "%#{params[:title]}%")
    else
      # @games = Game.order("rand()").all
      @games = Game.all
    end
  end
end
