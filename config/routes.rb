Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:show, :update]
  resources :members, only: [:show]
  devise_for :users,
          controllers: {
            sessions: 'users/sessions',
            registrations: 'users/registrations'
          }
end
