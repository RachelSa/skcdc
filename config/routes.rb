Rails.application.routes.draw do
  root "general#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  #get '/login_request', to: 'users#request'

  resources :programs
  resources :classrooms
  resources :contacts
  resources :users
  resources :program_classrooms
  resources :collaborations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
