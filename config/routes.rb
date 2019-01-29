Rails.application.routes.draw do

  root 'tests#index'
  
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