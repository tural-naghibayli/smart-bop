Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'about', to: 'pages#about' in future if we needed about page
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bops, only: [:index]
  resources :rigs, only: [:show, :index]

  resources :bops, only: [:show, :new ] do
    resources :function_tests, only: [:new, :create]
    resources :pressure_tests, only: [:new, :create]
  end

  resources :pressure_tests, only: [:show, :index] do
    resources :component_pressure_tests, only: [:new, :create, :show]
    resources :safety_valve_tests, only: [:new, :create, :show]
    resources :approvals, only: [:new, :create, :show]
    member do
      patch :approve
    end
    collection do
      get :preview
    end
  end


  resources :function_tests, only: [:show, :index] do
    resources :component_function_tests, only: [:new, :create, :show]
    member do
      patch :approve
    end
    collection do
      get :preview
    end
  end

  resources :pressure_tests, only: [:edit, :update, :delete]
  resources :function_tests, only: [:edit, :update, :delete]
  resource :dashboard, only: [:show]
end
