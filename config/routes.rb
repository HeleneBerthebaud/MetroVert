Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :gardens do
    resources :garden_steps, only: [:create]
  end

  resources :garden_steps, only: [:show, :edit, :update]

  resources :gardens
  resources :steps, only: [:show]

  get "gardens/:id/packages", to: "gardens#packagechoice", as: "packagechoice"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
