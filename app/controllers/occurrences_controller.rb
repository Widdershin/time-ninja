class OccurrencesController < ApplicationController
  def show
    render json: FetchGoogleCalendar.new(current_user).get.map(&:to_json)
  end
end
