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
      redirect_to new_user_url
      return
    end

    log_in_user!(user)

    if user.save
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def destroy
    unless current_user.nil?
      current_user.reset_session_token!
    end

    session[:session_token] = nil
    redirect_to new_user_url
  end

  def user_params
    params.require(:user).permit(:email, :password)

  end

end
