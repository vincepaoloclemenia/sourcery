Rails.application.routes.draw do
  root "pages#index"
  devise_for :users
  get 'user_signup' => 'pages#user_signup', as: :register
  get 'inquire' => 'pages#inquire', as: :inquire
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
