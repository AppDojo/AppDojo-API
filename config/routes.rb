AppDojoApi::Application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  scope :api, path: 'api', default: :json, constraints: FormatTest.new(:json) do
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

  scope module: 'web' do
    get '*foo', to: 'dojo#index', constraints: FormatTest.new(:html)
    get '/', to: 'dojo#index', constraints: FormatTest.new(:html)
  end
end
