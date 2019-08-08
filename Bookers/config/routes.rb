Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  root 'users_images#index'

  get 'books' => 'books#index'

  root 'pages#home'
  
  get 'pages/about' => 'pages#about'

  get 'sessions/new'

  get 'users/new'

 root 'static_pages#home'
  get     '/help',    to: 'static_pages#help'
  get     '/about',   to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :users


delete 'books/:id' => 'books#destroy', as: 'destroy_book'
patch 'books/:id' => 'books#update', as: 'update_book'
end
