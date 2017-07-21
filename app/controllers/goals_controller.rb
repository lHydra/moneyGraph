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

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    new_sum = @goal.start_money + params[:add_money].to_i
    if @goal.update(start_money: new_sum)
      redirect_to goals_path
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :start_money, :end_money, :user_id, :start_at, :end_at)
  end
end
