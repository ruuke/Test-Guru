Rails.application.routes.draw do

  get 'users/new'
  root 'tests#index'

  get :login, to: 'sessions#new'
  get :signup, to: 'users#new'
  get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create
  
  resources :tests do
    resources :questions, shallow: true, expect: :index do
      resources :answers, shallow: true, expect: :index
    end

    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end