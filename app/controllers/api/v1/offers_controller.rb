class Api::V1::OffersController < ApplicationController
    before_action :doorkeeper_authorize!, only: [:destroy, :create, :update]
    before_action :check_admin, only: [:destroy, :create, :update]

    has_scope :by_annual_refresh
    has_scope :by_area
    has_scope :by_degree
    has_scope :by_equity
    has_scope :by_equity_schedule
    has_scope :by_experience
    has_scope :by_experience_level
    has_scope :by_greencard
    has_scope :by_group
    has_scope :by_job_function
    has_scope :by_job_type
    has_scope :by_level
    has_scope :by_title
    has_scope :by_interest_point
    has_scope :by_position_type
    has_scope :by_post_time
    has_scope :by_promotion_package
    has_scope :by_season
    has_scope :by_year
    has_scope :by_base_salary
    has_scope :by_relocation_fee
    has_scope :by_sign_bonus
    has_scope :by_year_bonus
    has_scope :by_apply_source
    has_scope :by_company_id
    has_scope :by_company_name

    def index
        @offers = apply_scopes(Offer).joins(:company).all
        if query_params[:offset]
            @offers  = @offers.offset(query_params[:offset].to_i)
        end

        if query_params[:limit]
            @offers  = @offers.limit(query_params[:limit].to_i)
        end
        
        if query_params[:list_id]
            @offers  = @offers.pluck(:id)
        else
            @offers = @offers.select("offers.*, companies.name AS company_name")
        end

        render json: { offers: @offers } 
    end
    
    def show
        if Offer.exists?(params[:id])
            @offer = Offer.find(params[:id])
            json_obj = @offer.as_json
            if @offer.company
                json_obj[:company_name] = @offer.company.name
            end

            render json: { success: true, offer: json_obj }
        else
            render json: { success: false }
        end
    end

    def destroy
        if Offer.exists?(params[:id])
            if Offer.destroy(params[:id])
                render json: { success: true, id: params[:id] }
            else
                render json: { success: false }
            end
        else
            render json: { success: false }
        end
    end

    def create
        unless company_param
            render json: { success: false, errors: {company: "company is empty!"} }
        end
    
        if Company.exists?(name: company_param)
            company = Company.find_by(name: company_param)
        else
            company = Company.create(name: company_param)
        end

        @offer = company.offers.new(offer_params)
        @offer.offerable = current_resource_owner
        if @offer.save
            render json: { success: true, id: @offer.id }
        else
            render json: { success: false, errors: @offer.errors }
        end
    end
    
    def update
        @offer = Offer.find(params[:id])

        if company_param && @offer.company.name != company_param
            if Company.exists?(name: company_param)
                company = Company.find_by(name: company_param)
            else
                company = Company.create(name: company_param)
            end
            @offer.company = company
            unless @offer.save
                render json: { success: false, errors: "Company update error" }
            end
        end

        if @offer.update_attributes(offer_params)
            render json: { success: true }
        else
            render json: { success: false, errors: @offer.errors }
        end
    end

    def get_params
        target_column = query_params[:param_name]
        cnames = Offer.columns.map(&:name)
        if !cnames.include?(target_column)
            render json: { success: false }
        end

        values = Offer.pluck(target_column).uniq
        return_json = { success: true }
        return_json[target_column] = values
        render json: return_json
    end
    
    private
    def company_param
        params[:offer][:company_name]
    end

    def offer_params
        params[:offer][:source_id] = 2
        # params[:offer][:offerable_type] = "users", 
        # params[:offer][:offerable_id] = current_resource_owner.id

        params.require(:offer).permit(:post_title,
        :satisfaction,
        :annual_refresh,
        :area,
        :drgree,
        :equity,
        :equity_schedule,
        :experience,
        :experience_level,
        :greencard,
        :group,
        :job_function,
        :job_type,
        :level,
        :title,
        :interest_point,
        :other_offer,       
        :position_type,
        :promotion_package,
        :season,
        :url,
        :year,
        :base_salary,
        :relocation_fee_string,
        :sign_bonus_string,
        :source_id,
        :offerable_type,
        :offerable_id)
    end

    def check_admin
        unless current_resource_owner.has_role? :admin
            render json: { success: false , errors: "Only Admin can access" }
        end
    end

    def query_params
        params.permit(:limit, :offset, :list_id, :param_name,
        :by_annual_refresh,
        :by_area,
        :by_degree,
        :by_equity, 
        :by_equity_schedule,
        :by_experience, 
        :by_experience_level,
        :by_greencard,
        :by_group,
        :by_job_function,
        :by_job_type,
        :by_level,
        :by_title,
        :by_interest_point,
        :by_position_type,
        :by_post_time,
        :by_promotion_package,
        :by_season,
        :by_year,
        :by_base_salary,
        :by_relocation_fee,
        :by_sign_bonus,
        :by_year_bonus,
        :by_apply_source,
        :by_company_id,
        :by_company_name)
    end
    
    def set_offer
        @offer = Offer.find(params[:id])
    end
end
