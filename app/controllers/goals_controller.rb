class GoalsController < ApplicationController
  def index
    @goals = current_user.goals if current_user
  end

  def new
    @goal = Goal.new
  end

  def create
    start_at = Date.strptime(params[:start_at], '%m/%d/%Y')
    end_at = Date.strptime(params[:end_at], '%m/%d/%Y')
    @goal = current_user.goals.new(goal_params)
    @goal.start_at = start_at
    @goal.end_at = end_at
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :start_money, :end_money, :user_id, :start_at, :end_at)
  end
end
