Rails.application.routes.draw do
  root 'landing_page#splash'

  devise_for :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :transactions, only: [:index, :show, :new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

