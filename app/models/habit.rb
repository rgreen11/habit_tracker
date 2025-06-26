class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_logs, dependent: :destroy

  validates :user, presence: true
  validates :name, :frequency_unit, :frequency_value, :start_date, presence: true
  validates :frequency_unit, inclusion: { in: ["day", "week"] }
  validates :frequency_value, numericality: { only_integer: true, greater_than: 0 }

  before_validation :set_default_start_date, on: :create

  def set_default_start_date
    # Ensures every row has a start date
    self.start_date ||= Date.today
  end
end