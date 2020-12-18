Rails.application.routes.draw do
  resources :pins
  root to:'pages#index',as:'home'
  get 'posts/new',as:'post_new'
  
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
