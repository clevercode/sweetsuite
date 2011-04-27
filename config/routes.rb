SweetSuite::Authentication::Application.routes.draw do

  root :to => "profiles#show"
  resource :profile

  devise_for :users
  
  resources :users, :only => %w( show ) do
    root :to => "profiles#show"
  end

  controller 'oauth', :path => 'oauth' do
    get 'authorize', :action => 'authorize'
    post 'access_token', :action => 'access_token'
    get 'user', :action => 'user'
  end

  namespace :confectionery do
    root :to => 'applications#index'
    resources :applications
    resources :users
  end

end
