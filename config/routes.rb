Rails.application.routes.draw do
  resources :subfreds
  resources :users
  root 'posts#index'
  resources :posts do
    member do
    get :vote
    get :link_vote
    get :down_vote
  end
end
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create', as: :login_user
  get '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
