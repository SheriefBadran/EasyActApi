class ActivitiesController < ApplicationController

  def index
    activities = Activity.all
    render json: activities, status: 200
  end
end
