Rails.application.routes.draw do
  devise_for :admins, path: 'admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index"
  as :admin do 
    get "/admin/sign_out" => 'devise/sessions#destroy'
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end 
  as :user do
    get "/users/sign_out" => 'devise/sessions#destroy'
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
