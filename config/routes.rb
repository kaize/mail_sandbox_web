require 'sidekiq/web'

MailSandboxWeb::Application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount Sidekiq::Web, at: "/sidekiq"

  namespace :api do
    resources :mail_messages, :only => [:create, :destroy] do
      collection do
        get :last_minute_count
      end
    end
    resources :users, only: [:index]

    resources :mail_applications, only: [:index, :show, :create, :update] do
      scope module: :mail_applications do
        resources :mail_messages, only: [:index, :show, :update] do
          collection do
            patch :batch_update
          end
        end
      end
      member do
        put :mark_all_messages_as_read
      end
    end
  end

  scope :module => :web do

    namespace :account do
      root to: 'profile#edit'
      resource :profile, only: [:edit, :update]
    end

    root to: "welcome#index"

    resources :mail_applications do
      resources :mail_messages, :only => [:index, :show]
    end

    resource :angular_template, only: [:show]

    get 'mail_applications',       to: 'mail_applications#index'
    get 'mail_applications/*path', to: 'mail_applications#index'


    resources :users do
      member do
        get :confirm
        get :reset
      end
    end

    resource :user, only: [:index] do
      scope :module => :user do
        resource :session, only: [:new, :create, :destroy]
        resource :password, only: [] do
          get :forget
          post :reset
        end
        resource :network, only: [] do
          get :failure, :on => :member
        end
        resource :facebook, :only => [] do
          get :callback, :on => :member
        end
        resource :github, :only => [] do
          get :callback, :on => :member
        end
      end
    end

  end

end
