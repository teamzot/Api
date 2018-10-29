class Api::V1::OffersController < ApplicationController
    def index

        @offers = Offer.all
        if query_params[:offset]
            @offers  = @offers.offset(query_params[:offset].to_i)
        end

        if query_params[:limit]
            @offers  = @offers.limit(query_params[:limit].to_i)
        end

        if query_params[:list_id]
            @offers  = @offers.pluck(:id)
        end

        render json: { offers: @offers } 
    end
    
    def show
        if  Offer.exists?(params[:id])
            @offer = Offer.find(params[:id])
            render json: { success: true, offer: @offer }
        else
            render json: { success: false }
        end
    end

    def get_params
        target_column = query_params[:param_name]
        cnames = Offer.columns.map(&:name)
        if !cnames.include?(target_column)
            render json: { success: false }
        end

        values = Offer.pluck(target_column).uniq
        return_json = {success: true}
        return_json[target_column] = values
        render json: return_json
    end
    
    private
    def query_params
        params.permit(:limit, :offset, :list_id, :param_name)
    end
    
    def set_offer
        @offer = Offer.find(params[:id])
    end
end
