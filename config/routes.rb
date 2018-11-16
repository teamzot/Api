Rails.application.routes.draw do
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end

  namespace :api do
    namespace :v1 do
      resources :offers, only: [:index, :show, :delete] do
        collection do
          get 'get_params'
        end
      end

      resources :companies, only: [:index, :show]

      # use_doorkeeper do
      #   # No need to register client application
      #   skip_controllers :applications, :authorized_applications, :offers
      # end
      # api use only
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
    end
  end
end
