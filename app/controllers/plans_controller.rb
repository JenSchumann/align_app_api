class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy, :edit]

  # GET /plans
  def index
    @plans = Plan.all

    # render json: @plans
    render json: @plans.to_json(include: :user)
  end

  # GET /plans/1
  def show
    # render json: @plan
    render json: @plans.to_json(include: :user)
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: @plan.to_json(include: :user), status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    if @plan.update(plan_params)
      render json: @plan.to_json(include: :user)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      params.require(:plan).permit(:user_id, :affective_goal, :academic_goal, :task, :measure, :actions, :purpose, :deadline)
    end
end
