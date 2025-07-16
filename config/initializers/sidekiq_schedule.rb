require 'sidekiq/cron/job'

Sidekiq::Cron::Job.create(
  name: 'Daily Habit Reminder - every day at 9am',
  cron: '0 9 * * *',
  class: 'SendReminderJob',
  args: ['daily']
)

Sidekiq::Cron::Job.create(
  name: 'Weekly Habit Reminder - every Monday at 9am',
  cron: '0 9 * * 1',
  class: 'SendReminderJob',
  args: ['weekly']
)
