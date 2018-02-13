Rails.application.routes.draw do
  resources :work_periods
  resources :users do 
    resources :tasks#, only: [:index, :show, :new, :create, :edit]
  end
  root "users#index"
  #get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
