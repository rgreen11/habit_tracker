require "rails_helper"

RSpec.describe HabitLog, type: :model do
  it "is invalid without a status" do
    habit_log = HabitLog.new(status: nil)
    expect(habit_log).to_not be_valid
  end
end
