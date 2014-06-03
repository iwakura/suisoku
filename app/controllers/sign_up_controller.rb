class SignUpController < ApplicationController
  def new
    redirect_to(root_url, alert: 'You are already signed in') if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_url, notice: 'You successfully signed up.')
    else
      render action: :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
