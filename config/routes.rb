Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offers, only: [:index, :show]

  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications, :offers
  end
  
  # api use only
  devise_for :users, controllers: {
    registrations: 'api/v1/users/registrations',
  }, skip: [:sessions, :password]

end
