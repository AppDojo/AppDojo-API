AppDojoApi::Application.routes.draw do

  root to: 'products#index'


  scope :api, path: 'api' do
    scope :v1, path: 'v1' do
      devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}, skip: [:sessions, :registrations]

      resources :check_ins, except: [:new, :edit]
      resources :meetings, except: [:new, :edit]
      resources :users, except: [:new, :edit, :create, :update, :destroy]
    end
  end

  # POST   /api/v1/users(.:format)               registrations#create
  # GET    /api/v1/users/sign_up(.:format)       registrations#new
  # GET    /api/v1/users/edit(.:format)          registrations#edit
  # PATCH  /api/v1/users(.:format)               registrations#update
  # PUT    /api/v1/users(.:format)               registrations#update
  # DELETE /api/v1/users(.:format)               registrations#destroy
  devise_scope :user do
    #put  'api/v1/users'             => 'registrations#update', as: :user_information_update
    post 'api/v1/users'             => 'registrations#create', as: :user_registrations
    post 'api/v1/users/sign_in'     => 'sessions#create', as: :sign_in
    delete 'api/v1/users/sign_out'  => 'sessions#destroy', as: :sign_out
  end
end
