Rails.application.routes.draw do
  root "general#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/mission', to: 'general#mission'
  get '/careers', to: 'general#careers'
  get '/admin', to: 'general#admin', as: 'admin'
  get '/classrooms/admin', to: 'classrooms#admin'
  get '/programs/admin', to: 'programs#admin'
  get '/parent_resources/admin', to: 'parent_resources#admin'
  get '/collaborations/admin', to: 'collaborations#admin'
  get '/contacts/admin', to: 'contacts#admin'
  get '/posts/admin', to: 'posts#admin'
  resources :programs
  resources :classrooms
  resources :contacts
  resources :users, only: [:new, :create]
  resources :collaborations
  resources :posts
  resources :parent_resources
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
