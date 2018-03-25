Rails.application.routes.draw do

  resources :bollywoods
  resources :hollywoods
  resources :footballs
  resources :leaderboards
  resources :crickets
  get 'home/index'
  get 'start/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' ,registrations: 'users/registrations'}
  # devise_scope :user do
  # 	delete 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_fuser_session
  # 	get 'sign_in', :to => 'users/sessions#new', :as => :new_fuser_session
  # end	
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
