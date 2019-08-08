Rails.application.routes.draw do
  
resources :books

get 'books/new'

get 'top' => 'root#top'

post 'books' => 'books#create'

end
