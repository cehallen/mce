Mce::Application.routes.draw do
  devise_for :users

  root 'movies#index'
  
  resources :movies do
    resources :words, only: [:show]
  end  
  resources :sentences,  only: [:show]
  resources :words, only: [:show]

  get 'about', to: 'about'
end
