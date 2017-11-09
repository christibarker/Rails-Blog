Rails.application.routes.draw do


  get 'sessions/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/show'

  get 'sessions/edit'

  get 'sessions/update'

  get 'sessions/destroy'

  get 'home/index'

  get 'users/index'

  resources :users
  resources :posts
  resources :sessions, except: [:destroy]
  delete '/sessions' => 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

end
