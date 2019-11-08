class RatingsController < ApplicationController
    def create
        @rating = Rating.create(rating_params)
        render json: @rating
    end

    private

    def rating_params
        params.permit(:novice_id, :expert_id, :rating)
    end
end
