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
  match "/auth/failure" => redirect("/")

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
