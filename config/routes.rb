Rails.application.routes.draw do



  get 'home/index'

  get 'users/index'

  resources :home
  resources :comments
  resources :users
  resources :posts
  resources :sessions, except: [:destroy]
  delete '/sessions' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

end   
