class SessionsController < ApplicationController
  def new
  end

  def create
    p = signin_params
    user = User.find_by(email: p[:email])
    # Authenticate comes from has_secure_password on our user model
    if user.present? && user.authenticate(p[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

  private

  def signin_params
    params.require(:email)
    params.require(:password)
    params.permit(:email, :password)
  end
end
