class HabitLog < ApplicationRecord
  belongs_to :habit

  validates :habit, :status, :log_date, presence: true

  validates :status, inclusion: { in: ["pending", "done", "missed", "skipped"] }
  validates :log_date, uniqueness: { scope: :habit_id, message: "has already been logged for this habit" }

  before_validation :set_default_log_date, on: :create

  private

  def set_default_log_date
    # Ensures every row has a start date
    self.log_date ||= Date.today
  end
end
