class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      session[:user_email]= @user.email
      session[:user_name] = @user.name
      session[:user_first_name] = @user.name.split(" ")[0]
      session[:user_last_name] = @user.name.split(" ")[1]
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:error] = "Credentials Invalid!!"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    session[:user_email] = nil
    session[:user_name] = nil
    session[:user_first_name] = nil
    session[:user_last_name] = nil
    flash[:notice] = "User logged out!"
    # redirect_to login_path
    # @creature = Creature.find(params[:id]).destroy
    redirect_to '/'
  end

end