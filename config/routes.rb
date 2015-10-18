Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users

  namespace :admin do
    get '/'         => 'admin#index',     as: 'dashboard'
    get 'settings'  => 'admin#settings',  as: 'settings'
    get 'learning'  => 'admin#learning',  as: 'learning'

    resources :setups
    resources :fields
    resources :groups
    resources :roles
    resources :courses do
      resources :course_steps
    end
    resources :learning_objects
  end

  resources :users
end
