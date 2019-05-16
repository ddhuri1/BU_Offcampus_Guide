Rails.application.routes.draw do
  
  resources :houses
  resources :houses
  get 'essentials', :to => 'essentials#index'
  
  scope '/essentials' do
    resources :groceries
    resources :medicals
    resources :households
    resources :clothings
  end
  
  get 'travel', :to => 'travel#index'
  
  scope '/travel' do
    resources :locals
    resources :buses
    resources :airports
    resources :carrentals
  end
  
  #get '/login/oauth/authorize', :to => 'sessions#new'

  match 'auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match 'auth/failure', :to => 'sessions/#failure', :via => [:get, :post]
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy', :as => :logout
  get '/cleanup', :to => 'sessions#cleanup', :as => :cleanup
 
  resources :users
  get 'faq/faq'
  get 'faq/contact'

  get 'dashboard/index'
  get 'welcome/login', :as => :welcome_login
  root 'welcome#login'
  
  get 'users/new_user' => 'users#new_user'
  get 'users/guest' => 'users#guest'
  get 'users/login' => 'users#login'
  

end