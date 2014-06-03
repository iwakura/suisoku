class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:alert] = 'Please check your credentials.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out'
  end
end
