Rails.application.routes.draw do
  resources :items
  root to: 'welcome#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # /users routes
  resources :users do
    resources :categories
    resources :budgets do
      resources :items
    end
  end
end
