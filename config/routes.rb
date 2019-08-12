Rails.application.routes.draw do
  get 'events/index' => "events#index"
  get 'about' => "home#about"
  get "/" => "home#top"
  get "events/new" => "events#new"
  get "events/:id" => "events#show"
  
  post "events/create" => "events/create"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
