class UserMailer < ApplicationMailer
  default from: 'richardcraiggreen@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end