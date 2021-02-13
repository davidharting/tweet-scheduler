class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @user = params[:user]
    @expiry = 1.hour
    @token = @user.signed_id(expires_in: @expiry, purpose: "password_reset")

    mail to: @user
  end
end
