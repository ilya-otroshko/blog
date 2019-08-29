Rails.application.routes.draw do

  root 'posts#index', as: 'home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :comments
  end
end
