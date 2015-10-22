class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      redirect_to new_session_url
      return
    end

    login_user!(user)
    
    if @user.save
      redirect_to user_url
    else
      redirect_to new_session_url
    end
  end

  def destroy

  end

  def user_params
    params.require(:user).permit(:email, :password)

  end

end
