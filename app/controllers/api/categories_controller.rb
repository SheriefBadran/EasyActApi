module Api
  class CategoriesController < ApplicationController
    def index
      categories = Category.all

      respond_to do |format|
        # Response header will show Content-Type: application/json
        format.json { render json: categories, status: 200 }

        # Response header will show Content-Type: application/xml
        # curl -IH "Access: application/xml" localhost:3000/categories
        # format.xml { render xml: categories, status: 200 }

        #format.html {render }
      end
    end
  end
end