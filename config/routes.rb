Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :studios, only: [:index]
  resources :movies,  only: [:show, :update]
  resources :actors,  only: [:show]
end
