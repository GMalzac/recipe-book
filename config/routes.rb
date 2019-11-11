# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    collection do
      get 'home' => 'recipes#home', as: :home
      get 'entrees-aperos' => 'recipes#category', category: 'Entrées et Apéros', as: :entreesetaperos
      get 'platsprincipaux' => 'recipes#category', category: 'Plats principaux%', as: :platsprincipaux
      get 'desserts' => 'recipes#category', category: 'Desserts', as: :desserts
    end
  end

  root 'recipes#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
