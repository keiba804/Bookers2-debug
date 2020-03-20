Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create, :destroy]
  end
  root 'homes#top'
  get '/home/about' => 'homes#about', as: :about
end