Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    member do
    get :vote
    get :link_vote
    get :down_vote
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
