Rails.application.routes.draw do
  root "home#top"

  get '/' => "home#top"
  get '/home' => "home#top"
  get '/select' => "home#select"

  namespace 'api' do
    namespace 'v1' do
      resources :select, only: [:index]
    end
  end

end
