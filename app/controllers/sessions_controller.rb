class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = "Invalid Credentials"
      @user = User.new(username: params[:user][:username])
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
