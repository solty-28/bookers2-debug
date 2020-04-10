Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show, :index, :delete, :edit, :update]
  resources :books do
  	resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root to: 'home#top'
  get 'home/about' => 'home#about'

end
