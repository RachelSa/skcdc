Rails.application.routes.draw do
  root "general#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/payment', to: 'general#payment'
  get '/mission', to: 'general#mission'
  get '/careers', to: 'general#careers'
  get '/employees', to: 'general#employees'
  get '/admin', to: 'general#admin', as: 'admin'
  get '/classrooms/admin', to: 'classrooms#admin'
  get '/programs/admin', to: 'programs#admin'
  get '/parent_resources/admin', to: 'parent_resources#admin'
  get '/collaborations/admin', to: 'collaborations#admin'
  get '/contacts/admin', to: 'contacts#admin'
  get '/benefits/admin', to: 'benefits#admin'
  get '/career_sites/admin', to: 'career_sites#admin'
  get '/employee_resources/admin', to: 'employee_resources#admin'
  get '/posts/admin', to: 'posts#admin'
  get '/admin/super', to: 'users#super', as: 'super_admin'
  post '/super', to: 'users#create_super'
  get '/carousel/admin', to: 'carousel#new'
  patch '/carousel/admin/:id', to: 'carousel#create', as: "carousel"
  resources :programs
  resources :classrooms
  resources :contacts
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :collaborations
  resources :posts
  resources :parent_resources
  resources :benefits, only: [:new, :create, :edit, :update, :destroy]
  resources :career_sites, only: [:new, :create, :edit, :update, :destroy]
  resources :employee_resources, only: [:new, :create, :edit, :update, :destroy]
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
