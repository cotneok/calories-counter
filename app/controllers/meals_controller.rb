class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  access user: [:show, :index, :create, :update, :destroy, :new, :edit], user_manager: {except: [:destroy]}, site_admin: :all

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  def search
    @user = current_user
    if (params[:q1].blank? || params[:q2].blank? || params[:q3].blank? ||params[:q4].blank?)
        @meal = Meal.all
       flash[:notice] = "Please fill in blank fields"
     else 
        date1 = params[:q1].split("-")
        date2 = params[:q3].split("-")
        time1 = params[:q2].split(":")
        time2 = params[:q4].split(":")
        period1 = DateTime.new(date1[0].to_i, date1[1].to_i,date1[2].to_i, time1[0].to_i, time1[1].to_i)
        period2 = DateTime.new(date2[0].to_i, date2[1].to_i, date2[2].to_i, time2[0].to_i, time2[1].to_i)
        all = Meal.all
        @meal = all.search(all, period1, period2)
    end
  end 

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    respond_to do |format|
      if @meal.save
        format.html { redirect_to user_path(current_user.id), notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to user_path(current_user.id), notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:name, :date, :time, :calories)
    end
end
