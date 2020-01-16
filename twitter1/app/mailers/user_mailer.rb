class UserMailer < ApplicationMailer
  default from: "ng@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.singup_confirmation.subject
  #
  def signup_confirmation
    #@user=user
    @greeting = "thank for sign up"
    mail(to: "naren.gaindhar92@gmail.com", subject: "Sign Up singup_confirmation")
  end
end
