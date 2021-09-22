Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bops, only: [:index]
  resources :rigs, only: [:show, :index]

  resources :bops, only: [:show, :new ] do
    resources :pressure_tests, only: [:new, :create]
  end

  resources :pressure_tests, only: [:show] do
    resources :component_pressure_tests, only: [:new, :create, :show]
    resources :safety_valve_tests, only: [:new, :create, :show]
    member do
      patch :approve
    end
  end

  resources :pressure_tests, only: [:edit, :update, :delete]
  resource :dashboard, only: [:show]
end
