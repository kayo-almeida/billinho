class Api::V1::InvoicesController < Api::V1::ApiController

  # GET /invoices
  def index
    @invoices = reducer_filters.apply(params)

    render_success @invoices
  end

  # GET /invoices/1
  def show
    render_success Invoice.find(params[:id])
  end

  # GET /invoice/update-status
  def update_status
    Invoice.where("due_date < ?", DateTime.now.to_date).where(status: 0).update_all(status: 1)
    render_success
  end


  private
    # Config filters
    def reducer_filters
      Rack::Reducer.new(
        Invoice.select(params[:fields] || "*").all,
        ->(invoice_amount:) { where(invoice_amount: invoice_amount) },
        ->(due_date:) { where(due_date: due_date) },
        ->(sort:) { sort_by { |item| item[sort.to_sym] } }
      )
    end
end
