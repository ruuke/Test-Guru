Rails.application.routes.draw do
  get 'about/index'
  get 'welcome/index'
  get 'about/author'

  resources	:about

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
