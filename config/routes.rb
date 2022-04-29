Rails.application.routes.draw do

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

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
