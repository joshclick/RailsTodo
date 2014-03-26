HAWTodo::Application.routes.draw do
  root to: 'tasks#view'

  get '/tasks/count'  => 'tasks#count'
  resources :tasks

  devise_for :users
  namespace :admin do
    root to: 'admin#index'
  end
end
