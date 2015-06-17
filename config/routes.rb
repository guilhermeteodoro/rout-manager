Rails.application.routes.draw do
  resources :maps, param: :name, except: [:new, :edit] do
    member do
      post :best_route
    end
  end
end
