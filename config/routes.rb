Rails.application.routes.draw do
  get 'activities/new'

  root to: "home#index"

  devise_for :users

  resource :activities
end
