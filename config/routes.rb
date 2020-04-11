Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get 'login-tutor', to: 'sessions_tutors#new'
  get 'login-student', to: 'sessions_students#new'
  post 'signin-tutor', to: 'sessions_tutors#create'
end
