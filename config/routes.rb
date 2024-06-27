Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"
  resources :articles do
    resources :comments, only: [:create, :destroy, :update, :edit] do
      get :reply
    end
  end

  resources :likes, only: [:create, :destroy]
end
