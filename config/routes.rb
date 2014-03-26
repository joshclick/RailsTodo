HAWTodo::Application.routes.draw do
  root    :to         => 'tasks#view'
  devise_for :users

  get '/tasks/count'  => 'tasks#count'
  resources :tasks
end
