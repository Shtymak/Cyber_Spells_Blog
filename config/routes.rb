Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:'pages#index',as:'home'
  get 'posts/new',as:'post_new'
  resources :users
  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes
    resources :ratings
  end
  resources :categories, only: %i[show index]
  resources :comments, only: %i[destroy]
  post "comments/:comment_id", to:"comments#comment_create",as: "comment_comments"


  resources :conversations do
  resources :messages
 end

 post '/users/:id/follow', to: "users#follow", as: "follow_user"
 post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

get :search, to: 'posts#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
