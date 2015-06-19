Rails.application.routes.draw do
  resources :maps, param: :name, except: [:new, :edit] do
    get 'route/solve' => 'routes#solve'
  end
end
