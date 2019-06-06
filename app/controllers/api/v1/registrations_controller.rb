class Api::V1::RegistrationsController < Api::V1::ApiController
  before_action :set_registration, only: [:show, :update, :destroy]

  # GET /registrations
  def index
    @registrations = reducer_filters.apply(params)

    render_success @registrations
  end

  # GET /registrations/1
  def show
    render_success @registration
  end

  # GET /registrations/1/invoices OR /registrations/1/invoices/1
  def invoices
    render_success params[:invoice_id].blank? ? Registration.find(params[:registration_id]).invoices : Invoice.find(params[:invoice_id])
  end

  # POST /registrations
  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      render_success @registration
    else
      render_error @registration.errors, true
    end
  end

  # PATCH/PUT /registrations/1
  def update
    if @registration.update(registration_params)
      render_success @registration
    else
      render_error @registration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registrations/1
  def destroy
    @registration.destroy
    render_success
  end

  private
    # Config filters
    def reducer_filters
      Rack::Reducer.new(
        Registration.select(params[:fields] || "*").all,
        ->(total_course_amount:) { where(total_course_amount: total_course_amount) },
        ->(installments_number:) { where(installments_number: installments_number) },
        ->(due_day:) { where(due_day: due_day) },
        ->(course_name:) { where(course_name: course_name) },
        ->(sort:) { sort_by { |item| item[sort.to_sym] } }
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.permit(:total_course_amount, :installments_number, :due_day, :course_name, :educational_institution_id, :student_id)
    end
end
