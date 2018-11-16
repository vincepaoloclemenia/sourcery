Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "pages#index"
  devise_for :users
  get 'user_signup' => 'pages#user_signup', as: :register
  get 'inquire' => 'pages#inquire', as: :inquire
  get "dashboard" => "pages#dashboard", as: :dashboard
  get "notifications" => "pages#notifications", as: :notifications
  post "create_inquiry" => "pages#create_inquiry", as: :create_inquiry

  resources :timelogs
  resources :users, only: [] do
    post :create_user, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
