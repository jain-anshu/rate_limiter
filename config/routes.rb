Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :examples, only: :index
  get '/examples/unlimited', to: 'examples#unlimited'
  get '/examples/limited', to: 'examples#limited'
end
