class ToppagesController < ApplicationController
  def index
    @reviews = Review.limit(10).order("created_at DESC")
    
    if params[:title].present?
      @games = Game.where('title LIKE ?', "%#{params[:title]}%")
    else
      rand = Rails.env.production? ? "RANDOM()" : "rand()"
      @games = Game.all.order(rand)
    end
  end
end
