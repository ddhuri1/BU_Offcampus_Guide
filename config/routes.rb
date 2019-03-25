Rails.application.routes.draw do
  #get 'users/new'
  #get 'users/index'
  get 'welcome/index'
  #get 'welcome/register'
  #resources :users
  #resources :houses
  #resources :grocery
  #resources :travel
  #root 'welcome#index'
  #resources :users
  #root :to => "welcome#index"
  #root :new_user => "users#new"
  #root :guest => "users#guest"
  get 'welcome/index' => 'welcome#index'
  get 'users/new_user' => 'users#new_user'
  get 'users/guest' => 'users#guest'
  get 'users/login' => 'users#login'
  root 'welcome#index'
end