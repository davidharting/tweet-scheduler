class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to(root_path, notice: "If an account with that email was found, we have sent a link to reset your password.")
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "That password reset link was either expired or invalid. Please request a new reset link."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(update_password_params)
      redirect_to signin_path, notice: "Your password was reset successfully. Please sign in with your new password."
    else
      render :edit
    end
  end

  private

  def update_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
