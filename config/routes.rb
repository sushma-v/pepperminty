Rails.application.routes.draw do
  root to: 'pages#home'

  get '/home', to: 'pages#home', as: ''

  get '/website', to: 'pages#website'
  get '/seo', to: 'pages#seo'
  get '/advertising', to: 'pages#advertising'
  get '/social', to: 'pages#social'

  get '/contact', to: 'pages#contact'

  get '/privacy_policy', to: 'pages#privacy_policy'
  get '/cookie_policy', to: 'pages#cookie_policy'

  post "/submit_query" => "pages#submit_query"

end
