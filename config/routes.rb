AppDojoApi::Application.routes.draw do

  root to: 'products#index'


  scope :api, path: 'api' do
    scope :v1, path: 'v1' do
      devise_for :users, controllers: {:sessions => 'sessions'}, skip: [:sessions]
      resources :users, except: [:new, :edit]
    end
  end

  devise_scope :user do
    post 'api/v1/users/sign_in' => 'sessions#create', as: :sign_in
    delete 'api/v1/users/sign_out' => 'sessions#destroy', as: :sign_out
  end
end
