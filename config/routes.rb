SweetsuiteAuth::Application.routes.draw do
  
  devise_for :admins do
    root :to => redirect('/admin')
  end
  devise_for :users

  root :to => "devise/sessions#sign_in"

end
