Rails.application.routes.draw do
  resources :search, only: :index
end
