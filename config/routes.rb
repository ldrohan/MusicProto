Rails.application.routes.draw do
  devise_for :users
  root 'bands#index'

  get '/bands', to: 'bands#index'
  post '/bands/create', to: 'bands#create'
  get '/bands/delete', to: 'bands#delete'
  get '/bands/events', to: 'bands#events'
  
  post '/albums/create', to: 'albums#create'
  get '/albums/recent', to: 'albums#recent_albums'
end

#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                     root GET    /                              bands#index
#                    bands GET    /bands(.:format)               bands#index
#             bands_create POST   /bands/create(.:format)        bands#create
#             bands_delete GET    /bands/delete(.:format)        bands#delete
#            albums_create POST   /albums/create(.:format)       albums#create
#            albums_recent GET    /albums/recent(.:format)       albums#recent_albums
