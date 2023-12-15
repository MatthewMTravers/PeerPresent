Rails.application.routes.draw do
  resources :presentations
  # Root route for landing page
  root to: 'welcome#index'

  # Routes for login pages
  get '/login/student', to: 'sessions#new_student', as: 'login_student'
  post '/login/student', to: 'sessions#create_student'

  get '/login/faculty', to: 'sessions#new_faculty', as: 'login_faculty'
  post '/login/faculty', to: 'sessions#create_faculty'

  resources :sessions, only: [:new, :create, :destroy]
  get '/student/home', to: 'students#index', as: 'student_home'
  get '/faculty/home', to: 'faculties#index', as: 'faculty_home'
  delete '/logout', to: 'sessions#destroy', as: :logout
  
  # Routes back to welcome page - TODO: need to change?
  get '/logout', to: 'welcome#index'

  # Routes for all student functionality
  resources :students, only: [:index, :new, :create, :edit, :update, :destroy]
  get '/student/drop', to: 'students#destroy'
  get '/student/edit', to: 'students#edit'
  # Routes for all faculty functionality
  resources :faculties, only: [:index, :new, :create, :edit, :update]
  get '/faculty/edit', to: 'faculties#edit'
  # Routes for all presentation functionality
  get '/presentations', to: 'presentations#index'
  get '/presentations/edit', to: 'presentations#edit'
  get '/presentations/show', to: 'presentations#show'
  get '/presentations/new', to: 'presentations#new'


  # Routes for all evaluations
  resources :evaluations
  get '/evaluations/new', to: 'evaluations#new'

end

