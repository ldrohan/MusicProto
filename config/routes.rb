Rails.application.routes.draw do
  root 'bands#index'

  get '/bands', to: 'bands#index'
  post '/bands/create', to: 'bands#create'
  get '/bands/delete', to: 'bands#delete'
  
  post '/albums/create', to: 'albums#create'
  get '/albums/recent', to: 'albums#recent_albums'
end
