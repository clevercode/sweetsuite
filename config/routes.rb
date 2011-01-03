SweetSuite::Authentication::Application.routes.draw do

  root :to => "devise/sessions#sign_in"

  devise_for :users
  
  devise_for :admins do
    root :to => redirect('/admin')
  end

  controller 'oauth', :path => 'oauth' do
    get 'authorize', :action => 'authorize'
    get 'access_token', :action => 'access_token'
    get 'user', :action => 'user'
  end

end
