Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'search_subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    #resources :admins, only: [:index, :edit, :update] #Admins
    resources :admins
    resources :subjects
    resources :questions
  end
  namespace :users_backoffice do 
    get 'welcome/index' #Dashboard
    get 'profile', to:'profile#edit'
    patch 'profile', to: 'profile#update'
    get 'zip_code', to: 'zip_code#show'
  end
  
  devise_for :users
  devise_for :admins, skip: [:registrations]

  get 'inicio', to:'site/welcome#index'
  get 'backoffice', to: 'admins_backoffice/welcome#index'

  root to: 'site/welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
