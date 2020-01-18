Rails.application.routes.draw do
  get '*unmatched_route', to: redirect('/')

  get '/' => 'currencies#index', as: :currencies
  get  'currencies/:code' => 'currencies#show', as: :currency

  post 'currency_snapshots/' => 'currency_snapshots#capture_all', as: :capture_all_currencies
  post 'currency_snapshots/:code' => 'currency_snapshots#capture', as: :capture_currency
end
