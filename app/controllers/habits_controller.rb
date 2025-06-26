class HabitsController < ApplicationController
  def index
    if current_user
     @habits = current_user.habits
    else
      redirect_to '/'
    end
  end

  def show
    @habit = Habit.find(params[:id]) 
  end

  def new
    if current_user
      @habit = Habit.new
    else
      redirect_to '/'
    end
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    if @habit.save
      redirect_to habits_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def habit_params
    params.require(:habit).permit!
  end
end
