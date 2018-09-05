Rails.application.routes.draw do
  root "admins#index"

  get 'admins/new'
  get 'admins/edit'
  get 'admins/show'
  get 'admins/index'
  get 'tests/new'
  get 'tests/edit'
  get 'tests/show'
  get 'tests/index'
  get 'students/new'
  get 'students/edit'
  get 'students/show'
  get 'students/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :admins
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
