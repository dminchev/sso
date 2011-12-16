Sso::Application.routes.draw do
  devise_for :users, :path => "sessions"
  
  root :to => "index#home"
  resources :tokens, :only => [:create, :destroy]
  resources :clients, :users
  match "/me" => "index#me"
  
end
