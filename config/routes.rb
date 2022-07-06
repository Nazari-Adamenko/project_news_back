Rails.application.routes.draw do
  resources :posts
  resources :users
  devise_for :users,
          controllers: {
            sessions: 'users/sessions',
            registrations: 'users/registrations'
          }
  get '/member-data', to: 'members#show'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
