Rails.application.routes.draw do
  root 'bands#index'
  get '/bands', to: 'bands#index'
  post '/bands/create', to: 'bands#create'
end
