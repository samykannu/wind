class UserMailer < ApplicationMailer
  default from: 'samymailer256@gmail.com'
  def welcome_email(user)
    @user = user
    mail(to: @user.email,subject: "welcome mail")
  end
end
