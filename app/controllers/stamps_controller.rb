class StampsController < ApplicationController
  before_action :require_user_logged_in
  before_action :booleancast
  
  def create
    game = Game.find(params[:game_id])
    if current_user.have_stamp?(game)
      stamp = current_user.stamps.find_by(game_id: game.id)
      if stamp.update(stamp_params)
        redirect_to game
      else
        flash.now[:danger] = '送信に失敗しました。'
        rander game
      end
    else
      stamp = current_user.stamps.build(stamp_params)
      if stamp.save
        redirect_to game
      else
        flash.now[:danger] = '送信に失敗しました。'
        rander game
      end
    end
  end
  
private

  def booleancast
    params[:story] = ActiveRecord::Type::Boolean.new.cast(params[:story]) if params[:story].present?
    params[:game_system] = ActiveRecord::Type::Boolean.new.cast(params[:game_system]) if params[:game_system].present?
    params[:graphic] = ActiveRecord::Type::Boolean.new.cast(params[:graphic]) if params[:graphic].present?
    params[:game_character] = ActiveRecord::Type::Boolean.new.cast(params[:game_character]) if params[:game_character].present?
    params[:worldview] = ActiveRecord::Type::Boolean.new.cast(params[:worldview]) if params[:worldview].present?
  end

  def stamp_params
    params.permit(:game_id, :story, :game_system, :graphic, :game_character, :worldview)
  end
end
