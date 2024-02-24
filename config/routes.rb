Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/events/recommended', to: 'events#recommended', as: 'recommended'
  get '/dashboard', to: 'events#dashboard', as: 'dashboard'
  get '/events/:id/details', to: 'events#details', as: 'details'
  resources :events do
    resources :checkins, only: [:index, :create]
    resources :comments, only: [:index, :new, :create]
  end
  resources :checkins, only: [:destroy]
end
