Rails.application.routes.draw do
  root to: 'pages#home'

  get '/home', to: 'pages#home', as: ''

  get '/services', to: 'pages#services', as: 'services'
  get '/website', to: 'pages#website'
  get '/seo', to: 'pages#seo'
  get '/advertising', to: 'pages#advertising'
  get '/social', to: 'pages#social'

  get '/contact', to: 'pages#contact'

  post "/submit_query" => "pages#submit_query"

end
