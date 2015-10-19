Rails.application.routes.draw do

  namespace :admin do
  get 'videos/show'
  end

  namespace :admin do
  get 'slide_shows/show'
  end

  namespace :admin do
  get 'articles/show'
  end

  get 'course_steps/show'

  root to: 'home#index'
  devise_for :users

  resources :courses do
    resources :course_steps
  end
  resources :users
  resources :enrollments

  namespace :admin do
    get '/'         => 'admin#index',     as: 'dashboard'
    get 'settings'  => 'admin#settings',  as: 'settings'
    get 'learning'  => 'admin#learning',  as: 'learning'


    resources :requirements
    resources :assignments
    resources :setups
    resources :fields
    resources :schedules
    resources :enrollments
    resources :groups
    resources :roles
    resources :courses do
      resources :course_steps
    end
    resources :learning_objects
    post 'learning_objects/order' => 'learning_objects#order'
  end

end
