Rails.application.routes.draw do
  root 'static#home'

  get '/lists', to: 'users#show'
  
  post '/lists/modifylist', to: 'lists#modify', as: 'modify'

  post '/lists/destroylist', to: 'lists#destroy', as: 'destroy'

  get '/login', to: 'static#login'

  get '/lists/createlist', to: 'lists#create'

  # get '/groups', to: "groups#foo"

  post '/lists/createlist', to: 'lists#save', as: 'save'

  get '/signup', to: 'users#new'

  get 'static/home'
end
