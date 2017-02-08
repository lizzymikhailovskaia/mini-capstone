Rails.application.routes.draw do

  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  get '/images/new' => 'images#new'
  post '/images' => 'images#create'

  get '/users' => 'users#new'
	post '/users' => 'users#create'

  get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'

	get '/logout' => 'sessions#destroy'

  post '/orders' =>'orders#create'
  get '/orders/:id' =>'orders#show'

  post '/carted_products' => 'carts#create'
  get '/carted_products' =>'carts#index'
  delete '/carted_products/:id' => 'carts#destroy'


end
