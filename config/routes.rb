Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'customers/blacklist'
  get 'pdfs/pdaily'
  get 'pdfs/pmonthly'
  get 'pdfs/pweekly'
  post 'pdfs/pdaily'
  post 'pdfs/pmonthly'
  post 'pdfs/pweekly'
  get 'customers/four'
  get 'pdfs/index'
   resources :customers do
    resources :trajects
    resources :blacklisted_customers
    resources :emotions
    resources :orders
    resources :faces
  end



end
