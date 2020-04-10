Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get 'login-tutor', to: 'sessions#new_login_tutor'
  get 'login-student', to: 'sessions#new_login_student'
end
