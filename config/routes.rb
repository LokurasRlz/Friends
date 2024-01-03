Rails.application.routes.draw do
  devise_for :users
  resources :tools
  # get 'home/index'
  get 'home/about'
  # root 'home#index'
  root 'tools#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tools do
    patch 'reset_date_of_use', on: :member
  end
 

end
