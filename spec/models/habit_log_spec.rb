require "rails_helper"

RSpec.describe HabitLog, type: :model do
  let!(:user)  { User.create!(email: "test@example.com", password: "password") }
  let!(:habit) { user.habits.create!(name: "Exercise", frequency_unit: "day", frequency_value: 1, start_date: Date.today) }

  it "is invalid without a status" do
    habit_log = HabitLog.new(status: 'pending', habit_id: habit.id)
    expect(habit_log).to be_valid
  end

  it "is invalid without a status" do
    habit_log = HabitLog.new(status: nil)
    expect(habit_log).to_not be_valid
  end
end
