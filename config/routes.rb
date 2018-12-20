Rails.application.routes.draw do
  root to: 'pages#home'

  get '/home', to: 'pages#home', as: ''

  get '/about', to: 'pages#about'

  get '/website', to: 'pages#website'
  get '/seo', to: 'pages#seo'
  get '/paid_search', to: 'pages#paid_search'
  get '/social', to: 'pages#social'

  get '/contact', to: 'pages#contact'

  get '/privacy_policy', to: 'pages#privacy_policy'
  get '/cookie_policy', to: 'pages#cookie_policy'
  get '/sitemap', to: 'pages#sitemap'

  post "/submit_query" => "pages#submit_query"

end
