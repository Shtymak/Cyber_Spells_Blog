Rails.application.routes.draw do
  devise_for :users
  root to:'pages#index',as:'home'
  get 'posts/new',as:'post_new'
  
  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes
  end
  resources :comments, only: %i[destroy]
  post "comments/:comment_id", to:"comments#comment_create",as: "comment_comments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
