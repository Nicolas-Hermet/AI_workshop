Rails.application.routes.draw do
  devise_for :users
  root "missions#index"

  resources :clients, only: [:index, :show]
  resources :contracts, only: [:index, :show]
  resources :departments, only: [:index, :show]
  resources :employees, only: [:index, :show]
  resources :expenses, only: [:index, :show]
  resources :invoices, only: [:index, :show]
  resources :missions
  resources :projects, only: [:index, :show]
  resources :users, only: [:show, :edit, :update]
  resources :vendors, only: [:index, :show]

  get "/admin/dashboard", to: "admin#dashboard", as: :admin_dashboard

  namespace :api do
    namespace :v1 do
      resources :audit_events, only: [:index, :show]
      resources :clients, only: [:index, :show]
      resources :documents, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :leads, only: [:index, :show]
      resources :missions, only: [:index, :show]
      resources :notifications, only: [:index, :show]
      resources :skills, only: [:index, :show]
      resources :timesheets, only: [:index, :show]
      resources :users, only: [:show, :index]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
