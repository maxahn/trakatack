Rails.application.routes.draw do
  resources :work_periods
  resources :tasks
  resources :users
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
