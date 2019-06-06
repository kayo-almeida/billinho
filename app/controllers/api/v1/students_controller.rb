class Api::V1::StudentsController < Api::V1::ApiController
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    @students = reducer_filters.apply(params)

    render_success @students
  end

  # GET /students/1
  def show
    render_success @student
  end

  # GET /students/1/registrations OR /students/1/registrations/1
  def registrations
    render_success params[:registration_id].blank? ? Student.find(params[:student_id]).registrations : Registration.find(params[:registration_id])
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render_success @student
    else
      render_error @student.errors
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render_success @student
    else
      render_error @student.errors
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    render_success
  end

  private
    # Config filters
    def reducer_filters
      Rack::Reducer.new(
        Student.select(params[:fields] || "*").all,
        ->(name:) { where('lower(name) like ?', "%#{name.downcase}%") },
        ->(cpf:) { where(cpf: cpf) },
        ->(birthday:) { where(birthday: birthday) },
        ->(gender:) { where(gender: gender) },
        ->(payment_method:) { where(payment_method: payment_method) },
        ->(phone:) { where(phone: phone) },
        ->(sort:) { sort_by { |item| item[sort.to_sym] } }
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.permit(:name, :cpf, :birthday, :phone, :gender, :payment_method)
    end
end
