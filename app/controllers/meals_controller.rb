class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  access user: [:show, :search, :index, :create, :update, :destroy, :new, :edit], user_manager: {except: [:destroy]}, site_admin: :all

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  def search
    @user = current_user
    if (params[:q1].blank? || params[:q2].blank? || params[:q3].blank? || params[:q4].blank?)
        @meal = Meal.all
       flash[:notice] = "Please fill in blank fields"
     else 
        q1 = params[:q1].split("-")
        q3 = params[:q3].split("-")
        q2 = params[:q2].split(":")
        q4 = params[:q4].split(":")
        @meal = Meal.where("date >= :start_date AND date <= :end_date",{ start_date: DateTime.new(q1[0].to_i, q1[1].to_i, q1[2].to_i, q2[0].to_i, q2[1].to_i) , end_date: DateTime.new(q3[0].to_i, q3[1].to_i, q3[2].to_i, q4[0].to_i, q4[1].to_i)})
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
        format.html { redirect_to meals_path, notice: 'Meal was successfully created.' }
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
        format.html { redirect_to meals_path, notice: 'Meal was successfully updated.' }
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
      format.html { redirect_to meals_path, notice: 'Meal was successfully destroyed.' }
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
      params.require(:meal).permit(:name, :date, :calories)
    end
end
