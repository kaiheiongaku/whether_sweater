Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :munchies, only: :index
      resources :backgrounds, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
    end
  end
  # match '*unmatched_route', :to => 'application#raise_not_found!', :via => :all
end
