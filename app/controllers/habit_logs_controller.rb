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

  # You also want to put the status to
  # pending if the user did not complete etc
  def quick_check_in
    @habit = Habit.find(params[:habit_id])
    @habit_log = @habit.habit_logs.find_or_initialize_by(habit_id: @habit.id)
    @habit_log.status = "done"
    @habit_log.save!

    respond_to do |format|
      format.turbo_stream do
        render partial: "habits/habit", locals: { habit: @habit }
      end
      format.html { redirect_to habits_path, notice: "Habit marked as done!" }
    end
  end

  private

  def habit_log_params
    params.require(:habit_log).permit(:habit_id, :status)
  end
end
