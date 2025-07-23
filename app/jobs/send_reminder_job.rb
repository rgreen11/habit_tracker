class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(frequency)
    users = User.all

    users.find_each do |user|
      case frequency
      when "daily"
        Rails.logger.info "✅ Running SendReminderJob for #{frequency}"
        ReminderMailer.daily_reminder(user).deliver_later
      when "weekly"
        Rails.logger.info "✅ Running SendReminderJob for #{frequency}"
        ReminderMailer.weekly_reminder(user).deliver_later
      end
    end
  end
end