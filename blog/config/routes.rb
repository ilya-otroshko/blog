Rails.application.routes.draw do

  resources :likes
  resources :documents
  root 'posts#index', as: 'home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'


  resources :posts do
    resources :comments
    end

    resources :posts do
      resources :documents
      end
      
    resources :comments do
      resources :comments
        end
end
