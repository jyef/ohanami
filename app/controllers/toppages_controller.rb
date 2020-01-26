class ToppagesController < ApplicationController
  def index
    @games = Game.order("rand()").all
  end
end
