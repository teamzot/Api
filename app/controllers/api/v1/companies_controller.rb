class Api::V1::CompaniesController < ApplicationController
    has_scope :by_name

    def index

        @companies = apply_scopes(Company).all
        if query_params[:offset]
            @companies  = @companies.offset(query_params[:offset].to_i)
        end

        if query_params[:limit]
            @companies  = @companies.limit(query_params[:limit].to_i)
        end

        if query_params[:list_id]
            @companies  = @companies.pluck(:id)
        end

        render json: { companies: @companies } 
    end
    
    def show
        if  Company.exists?(params[:id])
            @company = Company.find(params[:id])
            json_obj = @company.as_json
            if @company.offers.count > 0
                json_obj[:offers] = @company.offers.pluck(:id, :post_title)
            end

            render json: { success: true, company: json_obj }
        else
            render json: { success: false }
        end
    end

    private
    def query_params
        params.permit(:limit, :offset, :list_id, :param_name, :by_company_name)
    end

    def set_company
        @company = Company.find(params[:id])
    end
end
