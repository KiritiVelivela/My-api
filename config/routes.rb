Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'customers/blacklist'
  get 'emotions/pd'
  get 'customers/four'
  post 'emotions/index'
  get 'emotions/index'
   resources :customers do
    resources :trajects
    resources :blacklisted_customers
    resources :emotions
    resources :orders
    resources :faces
  end



end
