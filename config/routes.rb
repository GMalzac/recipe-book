# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipes', to: 'recipes#index'
    resources :recipes

  root 'recipes#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
