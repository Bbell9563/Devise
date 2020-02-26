Rails.application.routes.draw do
  # get 'questions/show'
  # get 'questions/new'
  # get 'questions/index'
  # get 'questions/edit'
  # get 'questions/new'
  # get 'questions/edit'
  # get 'questions/show'
  # get 'quizzes/index'
  # get 'quizzes/show'
  # get 'quizzes/new'
  # get 'quizzes/edit'
  # root 'quizzes#index'
  root 'quizzes#index'
  devise_for :users
  resources :quizzes do
    resources :questions
  end

  resources :quetsions do 
    resources :answers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
