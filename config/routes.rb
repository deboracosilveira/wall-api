# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    registration: 'signup',
    sign_in: 'signin',
    sign_out: 'signout'
  },
  controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :posts, only: [:create, :index]
end
