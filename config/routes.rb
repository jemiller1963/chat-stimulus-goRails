require 'sidekiq/web'

Rails.application.routes.draw do

  # get 'users/index', to: 'users#index', as: 'members' # This is lists all userss
  # get 'users/show/:id', to: 'users#show', as: 'member' # This shows specific users from index
  # get 'users/:id', to: 'users#member', as:'member_home'  # This is the users landing page

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  resources :members

  resources :notes
  # resources :users
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
