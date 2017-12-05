Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  
  resources :posts, except: [:index] do
    resources :comments, only: [:new, :create]
  end
  
  resources :comments, only: [:create, :destroy, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
