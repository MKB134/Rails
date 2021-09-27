Rails.application.routes.draw do
root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index
  end
end
