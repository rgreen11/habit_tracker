class ReminderMailer < ApplicationMailer
  default from: 'no-reply@yourapp.com'

  def daily_reminder(user)
    @user = user
    mail(to: @user.email, subject: 'Your Daily Habit Reminder')
  end

  def weekly_reminder(user)
    @user = user
    mail(to: @user.email, subject: 'Your Weekly Habit Summary')
  end
end