Rails.application.routes.draw do

  get '/', to: 'events#index', as: 'home'
  get '/events/new', to: 'events#new', as: 'new_event'
  post '/events/new', to: 'events#create'
  get '/events/:id/show', to: 'events#show', as: 'event_show'
  get '/event/:id/suscribe', to: 'events#suscribe', as: 'suscribe'
  get '/event/:id/invite', to: 'events#invite', as: 'invite'
  post '/event/invite', to: 'events#share_invite', as: 'share_invite'

  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/user/:id/show', to: 'sessions#show', as: 'current_user'


  get '/signup', to: 'user#new', as: 'signup'
  post '/signup', to: 'user#create', as: 'create_user'
  get '/users/:id/show', to: 'user#show', as: 'user_show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
