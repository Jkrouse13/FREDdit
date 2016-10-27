Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    member do
    get 'vote' => 'posts#vote'
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
