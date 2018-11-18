Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]

  resources :quizzes do
    resources :questions
    resources :results, only: [:create, :show]
  end
  
  root({ to: 'home#index' })
end
