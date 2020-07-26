Rails.application.routes.draw do

  get 'activities/index'
  devise_for :users, path: 'u', controllers: {
    confirmations: 'confirmations'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'dashbord#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :episodes do
    resource :like, module: :episodes
    resources :comments, only: [:create, :destroy]
  end


  resources :posts, path: 'blog'
  resources :pages, path: 'p'
  resources :activities, path: 'feeds'


  resources :profile
  match '/profile/:id', to: 'profile#show', via: 'get'
  
end
