Rails.application.routes.draw do
  root "general#show"
  resources :programs
  resources :classrooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
