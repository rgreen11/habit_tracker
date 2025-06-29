class HabitLogsController < ApplicationController
  def index
     @habits = current_user.habits
  end

  def new
      @habit = Habit.find(params[:habit_id])
      @habit_logs = HabitLog.new(habit: @habit)
  end

  def create
    @habit_logs = HabitLog.new(habit_log_params)
    if @habit_logs.save

      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def habit_log_params
    params.require(:habit_log).permit(:habit_id, :status)
  end
end
