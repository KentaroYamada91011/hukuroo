Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  resources :charges,  only: %i(new create)
  get '/corporate'      => 'spree/static#corporate'
  get '/terms'          => 'spree/static#terms'
  get '/success'        => 'spree/static#success'
  get '/introduction'   => 'spree/static#introduction'
  get '/service'        => 'spree/static#service'
  get '/privacy_policy' => 'spree/static#privacy_policy'
  get '/optout'         => 'spree/static#optout'
  get '/upgrade'        => 'spree/static#upgrade'

  # 新規追加画面
  resources :products do
    resources :purchased_items,  only: %i(new create), controller: 'purchased_items'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
