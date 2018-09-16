Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # /users routes
  get '/:slug', to: 'users#show', as: 'user'
  get '/:slug/edit', to: 'users#edit', as: 'edit_user'
  patch '/:slug', to: 'users#update'

  # /budgets routes
  get '/:user_slug/budgets', to: 'budgets#index', as: 'user_budgets'
  get '/:user_slug/budgets/new', to: 'budgets#new', as: 'new_user_budget'
  get '/:user_slug/budgets/:slug/edit', to: 'budgets#edit', as: 'edit_user_budget'
  get '/:user_slug/budgets/:slug', to: 'budgets#show', as: 'user_budget'
  post '/:user_slug/budgets', to: 'budgets#create'
  patch '/:user_slug/budgets/:slug', to: 'budgets#update'
  delete '/:user_slug/budgets/:slug', to: 'budgets#destroy', as: 'destroy_user_budget'
end
