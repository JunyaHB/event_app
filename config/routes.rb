Rails.application.routes.draw do
  get 'events/index' => "events#index"
  get 'about' => "home#about"
  get "/" => "home#top"
  get "events/new" => "events#new"
  get "events/:id" => "events#show"
  get "events/:id/edit" => "events#edit"
  
  post "events/create" => "events/create"
  post "events/:id/update" => "events#update"
  post "events/:id/destroy" => "events#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
