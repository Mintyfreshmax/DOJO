Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get "/account", to: "users#account", as: :account

  get "/my_activities", to: "activities#my_activities", as: :my_activities

  resources :clubs, only: [:show, :create, :new, :edit, :update, :destroy] do
    resources :activities, only: %i[new create edit update destroy] do
      resources :bookings, only: :create
    end
    resources :messages, only: :create
  end

  resources :activities, except: %i[new create] do
    resources :bookings, only: :create
    resources :feedbacks, only: :create
  end

  get "/profile", to: "users#profile", as: :profile
  get "/personal_info", to: "users#personal_information", as: :personal_info
  get "/manage_dojos", to: "clubs#manage_dojos", as: :manage_dojos
  get "/contact", to: "pages#contact", as: :contact
  get "/terms_of_service", to: "pages#terms_of_service", as: :terms_of_service
  get "/privacy_policy", to: "pages#privacy_policy", as: :privacy_policy
end
