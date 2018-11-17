Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :quizzes do
    resources :questions 
  end
  
  root({ to: 'home#index' })
end
