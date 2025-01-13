Rails.application.routes.draw do
  get 'calculators/index', to: 'calculators#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :calculators, only:[:index] do
    collection do
      post :calculate
    end
  end
end
