Rails.application.routes.draw do
  resources :answers
root to: 'tests#index'

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
