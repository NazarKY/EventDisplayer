Rails.application.routes.draw do
  root 'events#index'

  get 'events/index'
  get 'events/show'
end
