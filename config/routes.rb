Rails.application.routes.draw do
  resources :categories, except: [:new, :edit] do
    member do
      get :inline_edit
    end
  end

  get '/blog_search/index'
  post '/blog_search/by_category', as: '/category_search'

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
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

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get '/blog_search/:query', to: 'blog_search#index'
  post '/blog_search/:query', to: 'blog_search#index'
end
