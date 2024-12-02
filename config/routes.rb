Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get "/my_clubs", to: "clubs#my_clubs", as: :my_clubs

  resources :clubs, only: [:show, :create, :new, :destroy] do
    resources :activities, only: %i[new create] do
      resources :bookings, only: :create
    end
  end

  resources :activities, except: %i[new create] do
    resources :bookings, only: :create
    resources :feedbacks, only: :create
  end
end
