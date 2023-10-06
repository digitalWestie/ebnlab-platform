class ProblemsController < ApplicationController
  before_action :set_project
  before_action :set_problem, only: %i[ show edit update destroy versions ]
  before_action :authenticate_user!, except: []

  def index
    @problems = @project.problems.all
  end

  def show
  end

  def new
    @problem = @project.problems.build
  end

  def edit
  end

  def create
    @problem = @project.problems.build(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to project_problem_url(@project, @problem), notice: "Problem was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to project_problem_url(@project, @problem), notice: "Problem was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to project_problems_url(@project), notice: "Problem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def versions
    @problems = @problem.versions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_problem
      @problem = @project.problems.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      params.require(:problem).permit(:name, :body, :confidence)
    end
end
