Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :locations, except: [:new, :edit]
    end
  end
end
