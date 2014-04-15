Mce::Application.routes.draw do
  root 'movies#index'
  resources :movies do
    resources :words, only: [:show]
  end
  
  resources :sentences,  only: [:show]
  resources :words, only: [:show]
end
