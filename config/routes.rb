MailSandboxWeb::Application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :api do
    resources :mail_messages, :only => [:create, :destroy] do
      member do
        put :mark_read
      end
      collection do
        get :last_minute_count
      end
    end
    resources :mail_applications, :only => [:show] do
      member do
        put :mark_all_messages_as_read
      end
    end
  end

  scope :module => :web do
    root :to => "welcome#index"

    namespace :account do
      root to: 'profile#edit'
      resource :profile, only: [:edit, :update]
    end

    resources :mail_messages, :only => [:index, :show] do
      member do
        get :raw
        get :without_bootstrap
      end
    end

    resources :mail_applications do
      resources :mail_messages, :only => [:index, :show]
    end

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
