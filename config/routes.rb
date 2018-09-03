Rails.application.routes.draw do
  root to: 'pages#home'

  get '/home', to: 'pages#home', as: ''
  get '/services', to: 'pages#services', as: 'services'
  get '/contact', to: 'pages#contact', as: 'contact'

end
