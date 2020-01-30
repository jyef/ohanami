class ToppagesController < ApplicationController
  def index
    @reviews = Review.limit(10).order("created_at DESC")
    
    if params[:title].present?
      @games = Game.where('title LIKE ?', "%#{params[:title]}%")
    elsif params[:sort].present? && params[:sort] == "1"
      @games = Game.all.order(created_at: :desc)
    elsif params[:sort].present? && params[:sort] == "2"
      @games = Game.all.order(created_at: :asc)
    else
      rand = Rails.env.production? ? "RANDOM()" : "rand()"
      @games = Game.all.order(rand)
    end
  end
end
