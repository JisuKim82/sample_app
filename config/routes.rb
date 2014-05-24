Rails.application.routes.draw do

  # match '/help', to: 'static_pages#help', via: 'get'
  # match '/about', to: 'static_pages#about', via: 'get'
  # match '/contact', to: 'static_pages#contact', via: 'get'
  # get 'static_pages/home'

  # get 'static_pages/help'

  # get '/static_pages/about'

  # get '/static_pages/contact'

  get '/signup' => "users#new"
  get '/help' => "static_pages#help"
  get '/about' => "static_pages#about"
  get '/contact' =>"static_pages#contact"

  root 'static_pages#home'

end
