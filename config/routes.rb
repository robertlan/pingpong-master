Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/history', to: 'games#history'
  get '/log',     to: 'games#new'
  resources :game
  post 'games/create', to: 'games#create', as: "create_game"
end
