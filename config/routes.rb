Rails.application.routes.draw do
  resources :ratings
  resources :messages
  resources :chat_rooms
  resources :comments
  resources :tasks
  resources :materials
  resources :resources
  resources :projects
  resources :expert_ins
  resources :project_types
  resources :users
  post '/login', to: 'auth#create'
end
