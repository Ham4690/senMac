Rails.application.routes.draw do
  root "home#top"

  get '/' => "home#top"
  get '/home' => "home#top"
  get '/select' => "home#select"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
