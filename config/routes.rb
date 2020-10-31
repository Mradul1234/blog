Rails.application.routes.draw do
  
  get 'admin', to: 'dashboard#index'
  get 'admin/users', to: 'dashboard#users'
  get 'admin/articles', to: 'dashboard#articles'
  post '/users/:id/make_admin', to: 'dashboard#make_admin', as: :make_admin
  # post 'admin/make_admin', to: 'dashboard#make_admin'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles
  resources :articles do
    get 'preview'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #  root 'application#home'
  root 'pages#home'
  # root 'articles#index'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create123'
  delete 'logout', to: 'sessions#destroy'

  resources :groups, except: [:destroy]

  get 'reset', to: 'resets#edit'
  post 'reset', to: 'resets#update'




  
end
