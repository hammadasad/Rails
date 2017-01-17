Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/photos/set_admin_access' => 'photos#set_admin_access'
  resources :photos
end
