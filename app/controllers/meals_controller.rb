class MealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @meals = current_user.meals
    @mealsToday = @meals.where("date >= ?", 1.day.ago.utc)
    @kcal_per_day = current_user.kcal_per_day
    @kcalToday = 0
    @mealsToday.each do |z|
      @kcalToday += z.allKcal
    end
    @kcalTodayF = Float(@kcalToday)
    @kcal_per_dayF = Float(@kcal_per_day)
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.new(meals_params)
    if @meal.save
      redirect_to meals_path, notice: "Meal has been added!"
    else
      render :new
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path, notice: "Meal has been removed!"
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update_attributes(meals_params)
      redirect_to @meal, notice: "Successfully updated meal."
    else
      render :edit
    end
  end

  private
  def meals_params
    params.require(:meal).permit(:name, :date, product_ids:[])
  end
end






