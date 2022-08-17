# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path_names: {sign_in: :login, sign_out: :logout},
             controllers: {
                registrations: 'users/registrations',
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
              }
  # resources :users
  root to: 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
