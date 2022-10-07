# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'gates#index'

  authenticate :user, lambda { |u| u.is_a?(Admin) } do
    mount Sidekiq::Web => '/sidekiq'
  end

  use_doorkeeper
  devise_for :users,
             path_names: {sign_in: :login, sign_out: :logout},
             controllers: {
                registrations: 'users/registrations',
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
              }
  resources :users, only: %i[show index] do
    member do
      patch 'verify'
      patch 'unverify'
    end

  end
  resources :gates, only: %i[index]
  resources :relations, only: %i[index create destroy] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end


  namespace :api do
    namespace :v1 do
      resources :exits, only: %i[create]
      resources :enters, only: %i[create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
