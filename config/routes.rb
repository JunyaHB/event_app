Rails.application.routes.draw do
  get 'events/index' => "events#index"

  get 'home/about' => "home#about"
  get "/" => "home#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
