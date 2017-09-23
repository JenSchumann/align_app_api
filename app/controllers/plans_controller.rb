class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy, :edit]

  # GET /plans
  def index
    @plans = Plan.where(user_id:
    params[:user_id])
    # render json: @plans
    render json: @plans

  end

# user_plan GET    /users/:user_id/plans/:id(.:format) plans#show
  # GET /plans/1
  def show
    # @plan = Plan.where(user_id: params[:user_id])
    render json: @plan
    # render json: @plan.plan_id
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)

    @plan.user_id = params[:user_id]

    if @plan.save
      render json: @plan, status: :created
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_params
      params.require(:plan).permit(:user_id, :affective_goal, :academic_goal, :task, :measure, :actions, :purpose, :deadline, :title)
    end
end
