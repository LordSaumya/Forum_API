Rails.application.routes.draw do
  #Routes
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :forum_threads, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
  end
end
