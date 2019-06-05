Rails.application.routes.draw do
  resources :invoices
  resources :registrations
  resources :students
  resources :educational_institutions
end
