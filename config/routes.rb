Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  root to: 'toppages#index'
  
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :myreviews
    end
  end
  resource :password, only: [:show, :edit, :update]
  resources :games
  resources :reviews, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :stamps, only: [:create]
end
