Rails.application.routes.draw do

  root 'users#new'

  resource :users, only: [:new, :create]
  resource :sessions, only: %i(new create destroy) 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
