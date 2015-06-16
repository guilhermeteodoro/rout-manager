Rails.application.routes.draw do
  resources :maps, only: [:index, :show, :create, :update, :destroy]
end
