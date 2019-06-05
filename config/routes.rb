Rails.application.routes.draw do
  resources :invoices
  resources :registrations
  resources :students
  resources :educational_institutions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
