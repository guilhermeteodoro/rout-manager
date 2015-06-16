Rails.application.routes.draw do
  resources :maps, except: [:new, :edit] do
    member do
      post :determine
    end
  end
end
