AppDojoApi::Application.routes.draw do

  root to: 'products#index'


  scope :api, path: 'api', default: :json do
    scope :v1, path: 'v1' do
      devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}, skip: [:sessions]
      resources :check_ins, except: [:new, :edit]
      resources :meetings, except: [:new, :edit]
      resources :users, only: [:index]
    end
  end

  devise_scope :user do
    post 'api/v1/users/sign_in' => 'sessions#create', as: :sign_in
    delete 'api/v1/users/sign_out' => 'sessions#destroy', as: :sign_out
  end
end
