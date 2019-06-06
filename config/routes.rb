Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
      
      resources :registrations do
        get "/invoices/" => :invoices
        get "/invoices/:invoice_id" => :invoices
      end

      resources :students do
        get "/registrations/" => :registrations
        get "/registrations/:registration_id" => :registrations
      end

      resources :educational_institutions do
        get "/registrations/" => :registrations
        get "/registrations/:registration_id" => :registrations
      end
    end
  end
end
