Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1, except: [:new, :edit] do
      resources :locations
      resources :people
      resources :statuses
    end
  end

end
