class Api::V1::EducationalInstitutionsController < Api::V1::ApiController
  before_action :set_educational_institution, only: [:show, :update, :destroy]

  # GET /educational_institutions
  def index
    @educational_institutions = reducer_filters.apply(params)

    render_success @educational_institutions
  end

  # GET /educational_institutions/1
  def show
    render_success @educational_institution
  end

  # GET /educational_institutions/1/registrations OR /educational_institutions/1/registrations/1
  def registrations
    render_success params[:registration_id].blank? ? EducationalInstitution.find(params[:educational_institution_id]).registrations : Registration.find(params[:registration_id])
  end

  # POST /educational_institutions
  def create
    @educational_institution = EducationalInstitution.new(educational_institution_params)

    if @educational_institution.save
      render_success @educational_institution
    else
      render_error @educational_institution.errors
    end
  end

  # PATCH/PUT /educational_institutions/1
  def update
    if @educational_institution.update(educational_institution_params)
      render_success @educational_institution
    else
      render_error @educational_institution.errors
    end
  end

  # DELETE /educational_institutions/1
  def destroy
    @educational_institution.destroy
    render_success
  end

  private
    # Config filters
    def reducer_filters
      Rack::Reducer.new(
        EducationalInstitution.select(params[:fields] || "*").all,
        ->(name:) { where('lower(name) like ?', "%#{name.downcase}%") },
        ->(cnpj:) { where(cnpj: cnpj) },
        ->(institution_type:) { where(institution_type: institution_type) },
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_educational_institution
      @educational_institution = EducationalInstitution.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def educational_institution_params
      params.permit(:name, :cnpj, :institution_type)
    end
end
