Rails.application.routes.draw do
  get 'books/new'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'top' => 'root#top'
 
  post 'books' => 'books#create'

  post 'users' => 'users#create'

  get 'books' => 'books#index'

  get 'books/:id' => 'books#show', as: 'book'

  get 'books/:id/edit' => 'books#edit', as: 'edit_book'

  get 'session' => 'session#new'

  root 'user_images#no_image.jpg#config'




resources :users, only: [:create :destroy :edit :index :new :show :update]

resources :books, only: [:create :destroy :edit :index :new :show :update]

end