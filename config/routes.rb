Rails.application.routes.draw do
  root "calculators#show"
  post 'calculate', to: 'calculators#calculate', as: 'calculate'
end
