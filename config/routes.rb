Rails.application.routes.draw do
  get 'occurrences/show'

  get 'activities/new'

  root to: "home#index"

  devise_for :users

  resource :activities
  resource :occurrences
end
