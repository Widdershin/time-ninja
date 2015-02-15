Rails.application.routes.draw do
  get 'activities/index'

  root to: "home#index"

  devise_for :users
end
