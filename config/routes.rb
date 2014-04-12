Mce::Application.routes.draw do
  root 'movies#index'
  resources :movies
  resources :sentences,  only: [:show]
end
