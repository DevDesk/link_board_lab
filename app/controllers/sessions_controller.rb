class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:error] = "Credentials Invalid!!"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "User logged out!"
    # redirect_to login_path
    # @creature = Creature.find(params[:id]).destroy
    redirect_to '/'
  end

end