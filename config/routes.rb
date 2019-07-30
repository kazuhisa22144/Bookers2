Rails.application.routes.draw do
 
  devise_for :users


  resources :users, only: [:index,:edit,:show,:update]
  resources :books 



 



  get '/' => 'users#top', as:"root"

  root 'users#top'

  get "/home/about" => "users#about", as: "about"
  
end
