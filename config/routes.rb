Rails.application.routes.draw do
  root to: "ypages#home"
  resources :ypages
  resources :categories
  resources :image_elements
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
    get 'login', to: 'users/sessions#new'
    get 'signup', to: 'users/registrations#new'
  end
  
end
