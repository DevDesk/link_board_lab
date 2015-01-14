class UsersController < ApplicationController

  # before_action :is_authenticated?


  def index
    # @user = current_user
    @user = User.find_by_id(session[:user_id])
    redirect_to login_path unless @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      session[:user_email]= @user.email
      flash[:success] = "User has signed up"
      redirect_to root_path
    else
      flash[:error] = "Credentials invalid"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end

  # def taco
  #   # @user = User.find_by_id(session[:user_id])

  # end

end