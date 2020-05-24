require 'sidekiq/web'

Rails.application.routes.draw do
  resources :channels do
    resource :channel_users
    resources :messages
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users
  root to: 'channels#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
