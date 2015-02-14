module Api
  class ActivitiesController < ApplicationController
    def index
      activities = Activity.all

      if category_id = params[:category_id]
        activities = activities.where(category_id: category_id)
      end

      respond_to do |format|
        # Response header will show Content-Type: application/json
        format.json { render json: activities, status: 200 }

        # Response header will show Content-Type: application/xml
        # curl -IH "Access: application/xml" localhost:3000/activities
        format.xml { render xml: activities, status: 200 }

        #format.html {render }
      end
    end

    def show
      activity = Activity.find(params[:id])
      render json: activity, status: 200
    end
  end
end



