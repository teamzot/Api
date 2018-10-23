class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

    respond_to :json

    protected
    def configure_permitted_parameters
        add_attrs = [:email, :first_name, :last_name]
        devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
        devise_parameter_sanitizer.permit :account_update, keys: add_attrs
    end

    private
    # Doorkeeper methods
    def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end
