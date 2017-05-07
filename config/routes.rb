Rails.application.routes.draw do
  root "general#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :programs
  resources :classrooms
  resources :contacts
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
