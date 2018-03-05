Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Homepage and About Us
  root 'home#index'
  get 'about_us', to: 'home#about_us'
  get 'store', to: 'home#store'
  #get 'users/edit_profile', to: 'users#edit_profile'
  #post 'users/update_profile', to: 'users#update_profile'
  
  # Article Resources
  resources :articles do
    resources :comments
  end
  
  mount ActionCable.server => '/cable'
  
  resources :categories, except: [:destroy]
  resources :users, only: [:show, :index]
  
  resources :profile, except: [:new, :create, :show, :index, :destroy], :controller => "profiles"
end
