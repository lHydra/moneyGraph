class GoalsController < ApplicationController
  before_action :find_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = current_user.goals if current_user
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.start_at_goal = params[:start_at]
    @goal.end_at_goal = params[:end_at]
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    new_sum = @goal.start_money + params[:add_money].to_f
    if @goal.update(start_money: new_sum)
      redirect_to goals_path
    else
      render :edit
    end
  end

  def destroy
    @goal.delete
    redirect_to goals_path
  end

  private

  def find_goal
    @goal = current_user.goals.find(params[:id]) if current_user
  end

  def goal_params
    params.require(:goal).permit(:title, :start_money, :end_money, :user_id)
  end
end
