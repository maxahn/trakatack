Rails.application.routes.draw do
  resources :users do 
    resources :tasks do #, only: [:index, :show, :new, :create, :edit]
      resources :work_periods
    end
  end
  root "users#index"
  #get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
