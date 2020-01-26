class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :password, :update]
  
  def index
    @users = User.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:modal_open] = 'ユーザー登録'
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def password
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      render :edit
    end
  end
  
  def myreviews
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :profile_image, :introduction, :twitter, :remove_profile_image)
  end
  
  def correct_user    
    unless params[:id] == session[:user_id].to_s
      redirect_to root_url
    end
  end
end
