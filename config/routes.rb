Rails.application.routes.draw do
  # root 'calculators/index', to: 'calculators#index'
  get 'calculators/index', to: 'calculators#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # post 'calculators/calculate', to: 'calculators#calculate'
  resources :calculators, only:[:index] do
    collection do
      post :calculate
    end
  end
end
