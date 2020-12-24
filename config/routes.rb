Rails.application.routes.draw do
  devise_for :users
  root to:'pages#index',as:'home'
  get 'posts/new',as:'post_new'
  
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
  resources :comments, only: %i[create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
