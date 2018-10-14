class OffersController < ApplicationController

    private
    def query_params
        params.permit(:p, :offset)
    end
    
    def set_offer
        @offer = Offer.find(params[:id])
    end
end
