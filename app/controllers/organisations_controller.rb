class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: []

  def index
    @organisations = Organisation.all
  end

  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to organisation_url(@organisation), notice: "Organisation was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisation_url(@organisation), notice: "Organisation was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url, notice: "Organisation was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organisation_params
      params.require(:organisation).permit(:name)
    end
end
