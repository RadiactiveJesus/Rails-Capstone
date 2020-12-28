Rails.application.routes.draw do
  get 'votes/create'
  get 'votes/destroy'
  root to: "ypages#home"
  resources :votes, only: [:create, :destroy]
  resources :categories
  resources :articles
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'ypages/new'
  get 'ypages/create'
  get 'ypages/update'
  get 'ypages/edit'
  get 'ypages/destroy'
  get 'ypages/index'
  get 'ypages/show'
end
