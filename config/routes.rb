Rails.application.routes.draw do
  get 'courses/new'
  get 'courses/edit'
  get 'courses/show'
  get 'courses/index'
  root "sessions#new"

  get 'instructors/new'
  get 'instructors/edit'
  get 'instructors/index'
  get 'instructors/show'

  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/index'
  get 'cohorts/show'

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
  resources :students do
    delete 'terminate' => 'students#destroy'
  end
  resources :instructors do
    delete 'terminate' => 'students#destroy'
  end
  resources :cohorts do
    resources :students
    resources :instructors
  end
  resources :courses do
    resources :students
    resources :instructors
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
