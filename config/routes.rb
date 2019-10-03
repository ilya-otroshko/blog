Rails.application.routes.draw do
  root 'posts#index', as: 'home'


  resources :likes, only: [:create, :destroy]
  resources :documents
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure' => redirect("/")
  get 'users/:confirm_token/confirm email', :to => 'sessions#create'
  get 'search', to: 'posts#index', as: 'search'

  resources :posts do
    resources :comments
    end
    
    resources :posts do
      resources :documents
      end
      
    resources :comments do
      resources :comments
        end
        
        resources :users do
          member do
            get :confirm_email
          end
        end
end
