class EducationalInstitutionsController < ApplicationController
  before_action :set_educational_institution, only: [:show, :update, :destroy]

  # GET /educational_institutions
  def index
    @educational_institutions = EducationalInstitution.all

    render json: @educational_institutions
  end

  # GET /educational_institutions/1
  def show
    render json: @educational_institution
  end

  # POST /educational_institutions
  def create
    @educational_institution = EducationalInstitution.new(educational_institution_params)

    if @educational_institution.save
      render json: @educational_institution, status: :created, location: @educational_institution
    else
      render json: @educational_institution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /educational_institutions/1
  def update
    if @educational_institution.update(educational_institution_params)
      render json: @educational_institution
    else
      render json: @educational_institution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /educational_institutions/1
  def destroy
    @educational_institution.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_educational_institution
      @educational_institution = EducationalInstitution.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def educational_institution_params
      params.require(:educational_institution).permit(:name, :cnpj, :institution_type)
    end
end
