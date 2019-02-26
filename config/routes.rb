Rails.application.routes.draw do

  resources :feedbacks, only: %i[new create]
  
  namespace :admin do
    get 'gists/index'
  end
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'users/sessions' }


  get 'users/new'
  root 'tests#index'

  authenticated :admin do
    root 'admin/tests#index', as: :authenticated_root
  end

  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true, expect: :index do
      resources :answers, only: :index, shallow: true, expect: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do   
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, expect: :index do
        resources :answers, shallow: true, expect: :index
      end
    end
  end

end
