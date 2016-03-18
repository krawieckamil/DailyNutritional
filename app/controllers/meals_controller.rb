class MealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @meals = current_user.meals
    @mealsToday = @meals.where("date >= ?", 1.day.ago.utc).count
    #@kcalToday= @meals.products.sum("kcal")
    # @activity = current_user.activities.new
  end

  def show
    @activity = Activity.find(params[:id])
    @duration = (@activity.end - @activity.start) / 60
    @type = TypeOfActivity.find(@activity.type_of_activity_id)
  end

  def create
    @user = current_user
    @meal = @user.meals.create(meals_params)
    @activity.update_attribute :fitpoints, (@activity.end-@activity.start).to_i / 60 / 2.0
    redirect_to user_activities_path
  end

  private
  def meals_params
    params.require(:meal).permit(:name, :date, :product_id)
  end
end
