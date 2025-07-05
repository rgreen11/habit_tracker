class HabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @habits = current_user.habits
  end

  def show
    @habit = Habit.find(params[:id]) 
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
  
    if @habit.save
      redirect_to habit_logs_new_path(habit_id: @habit.id), notice: "Habit created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def habit_params
    params.require(:habit).permit!
  end
end
