Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get 'login-tutor', to: 'sessions_tutors#new'
  delete 'logout-tutor', to: 'sessions_tutors#destroy'
  get 'login-student', to: 'sessions_students#new'
  delete 'logout-student', to: 'sessions_students#destroy'
  post 'signin-tutor', to: 'sessions_tutors#create'
  post 'signin-student', to: 'sessions_students#create'
  resources :tutors
  resources :students
end
