Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      match 'invoices/update-status' => 'invoices#update_status', via: :get
      resources :invoices, only: [:index, :show] do
        get "/update-status" => :update_status
      end
      
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
