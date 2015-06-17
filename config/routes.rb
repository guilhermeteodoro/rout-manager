Rails.application.routes.draw do
  resources :maps, except: [:new, :edit] do
    member do
      post :best_path
    end
  end
end
