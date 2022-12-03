Rails.application.routes.draw do

  resource :feedback, only: %i[new create]

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'users/sessions' }

  root to: 'tests#index'

  resources :answers

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :gists, only: :new do
    member do
      post :create
    end
  end

  resources :badges, only: :index do
    get :my, on: :collection
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :badges
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
