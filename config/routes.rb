require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notes

  resources :channels do
    resource :channel_users
    resources :messages
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users

  # root to: 'channels#index'

  get 'mine', to: 'notes#mine'
  root to: 'notes#index'
  # root to: 'application#root'
  # mount Shrine.presign_endpoint(:cache) => '/images/upload'
end
