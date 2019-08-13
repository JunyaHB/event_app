Rails.application.routes.draw do

  get "login" => "users#login_form"  
  get 'users/index' => "users#index"
  get "signup" => "users#new"
  get 'events/index' => "events#index"
  get 'about' => "home#about"
  get "/" => "home#top"
  get "events/new" => "events#new"
  get "events/:id" => "events#show"
  get "events/:id/edit" => "events#edit"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  
  post "users/create" => "users#create"
  post "events/create" => "events/create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "joins/:event_id/create" => "joins#create"
  post "events/:id/update" => "events#update"
  post "events/:id/destroy" => "events#destroy"
  post "users/:id/update" => "users#update"  
  post "joins/:event_id/destroy" => "joins#destroy"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
