Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create, :destroy]
  end
  root 'homes#top'
  get '/home/about' => 'homes#about', as: :about
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'follower_index/:id' => 'relationships#follower_index', as:'follower_index'
  get 'following_index/:id' => 'relationships#following_index', as:'following_index'
end