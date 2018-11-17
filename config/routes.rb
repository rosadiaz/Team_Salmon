Rails.application.routes.draw do
<<<<<<< HEAD

  resources :users, only: [:new, :create]
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

>>>>>>> origin/integration
  resource :sessions, only: [:new, :create, :destroy]

  resources :quizzes do
    resources :questions 
  end

  get("/leaderboard", { to: "home#leaderboard", as: :leaderboard })
  
  root({ to: 'home#index' })
end
