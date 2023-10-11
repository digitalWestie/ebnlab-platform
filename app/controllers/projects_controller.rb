class ProjectsController < ApplicationController
  before_action :set_organisation
  before_action :set_project, only: %i[ show edit update destroy versions ]
  before_action :authenticate_user!, except: []

  def index
    redirect_to organisation_url(@organisation)
  end

  def show
    @assignments = @project.assignments.order(:id).includes(:user).all
  end

  def new
    @project = @organisation.projects.build
  end

  def edit
  end

  def create
    @project = @organisation.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to organisation_project_url(@organisation, @project), notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to organisation_project_url(@organisation, @project), notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to organisation_projects_url(@organisation), notice: "Project was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_project
      @project = @organisation.projects.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :scope_description)
    end
end
