class PagesController < ApplicationController
  def index
    status_counts = HabitLog.joins(:habit).where(habits: { user_id: current_user.id }).group(:status).count
    default_statuses = %w[done missed pending skipped]
    @chart_data = default_statuses.index_with { |status| status_counts[status] || 0 }
  end
end
