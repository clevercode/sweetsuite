SweetSuite::Authentication::Application.routes.draw do

  root :to => "profiles#show"

  devise_for :users
  
  resources :users do
    root :to => "profiles#show"
  end
  
  resource :profile
  
  devise_for :admins do
    root :to => redirect('/admin')
  end

  controller 'oauth', :path => 'oauth' do
    get 'authorize', :action => 'authorize'
    post 'access_token', :action => 'access_token'
    get 'user', :action => 'user'
  end

end
