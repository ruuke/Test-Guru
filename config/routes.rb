Rails.application.routes.draw do

  resources :tests do
    resources :questions
  end
  
  root 'tests#index'
end