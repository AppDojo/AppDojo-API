AppDojoApi::Application.routes.draw do

  post    'login'  => 'sessions#create', as: :login
  delete  'logout' => 'sessions#destroy', as: :logout

  resources :users, except: [:new, :edit]


end
