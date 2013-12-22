MailSandboxWeb::Application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :api do
    resources :mail_messages, :only => [:create, :destroy] do
      collection do
        get :last_minute_count
      end
    end
    resources :users, only: [:index]

    resources :mail_applications, only: [:index, :show, :create, :update, :destroy] do
      scope module: :mail_applications do
        resources :mail_messages, only: [:index, :show, :update] do
          collection do
            patch :batch_update
          end
        end
      end
    end
  end

  scope :module => :web do

    namespace :account do
      root to: 'profile#edit'
      resource :profile, only: [:edit, :update]
    end

    root to: "welcome#index"

    resources :mail_applications, only: [:index]
    get '/mail_applications/*path', to: "mail_applications#index"
    resource :angular_template, only: [:show]

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
