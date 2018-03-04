Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Homepage and About Us
  root 'home#index'
  get 'about_us', to: 'home#about_us'
  get 'store', to: 'home#store'
  
  # Article Resources
  resources :articles
  resources :categories, except: [:destroy]
  resources :users, only: [:show, :index]
end
