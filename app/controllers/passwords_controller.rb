class PasswordsController < ApplicationController
  before_action :require_user_logged_in

  def show
    redirect_to controller: 'users', action: 'edit', id: current_user.id
  end

  def edit
    @user = current_user
  end
  
  def update
  @user = current_user
  current_password = params[:user][:current_password]

    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(user_params)
        if @user.save
          flash[:success] = 'パスワードを変更しました。'
          redirect_to controller: 'users', action: 'edit', id: current_user.id
        else
          render "edit"
        end
      else
        @user.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @user.errors.add(:current_password, :empty)
      render "edit"
    end
  end
  
  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end