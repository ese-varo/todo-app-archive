Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :lists do
    resources :tasks
  end

  root to: 'welcome#index'
end
