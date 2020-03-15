Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :lists, :tasks

  root to: 'welcome#index'
end
