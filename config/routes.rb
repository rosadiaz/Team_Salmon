Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resource :sessions, only: [:new, :create, :destroy]

  resources :quizzes do
    resources :questions 
  end
  
  get "/users/quizzes/completed", to: "users#completed_quizzes", as: "completed_quizzes"


  root({ to: 'home#index' })
end
