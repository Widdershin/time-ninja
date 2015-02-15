class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new
  end

  def create
    CreateActivity.new(current_user, allowed_creation_params).run
    redirect_to '/activities' # TODO - use a path helper
  end

  private

  def allowed_creation_params
    params.require(:activity).permit(
      :name,
      :minimum_duration,
      :maximum_duration,
      :desired_amount,
    )
  end
end
