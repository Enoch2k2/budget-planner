Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # /users routes
  get '/:slug', to: 'users#show', as: 'user'
  get '/:slug/edit', to: 'users#edit', as: 'edit_user'
  patch '/:slug', to: 'users#update'
end
