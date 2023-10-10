class AssignmentsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_assignable, only: :new

  def new
    @assignment = Assignment.new(assignable: @assignable)
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignable = @assignment.assignable
    if @assignment.save
      redirect_to @assignable, notice: 'Team member was successfully assigned.'
    else
      render :new
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to @assignment.assignable, notice: 'Team member was removed.'
  end

  private

  def set_assignable
    if params[:project_id]
      @assignable = Project.find(params[:project_id]) # Assuming you have a Project model
    elsif params[:organisation_id]
      @assignable = Organisation.find(params[:organisation_id]) # Assuming you have an Organisation model
    else
      raise ActiveRecord::RecordNotFound, "No valid assignable type found."
    end
  end

  def assignment_params
    cleaned = params.require(:assignment).permit(:user_id, :email, :assignable_type, :assignable_id)
    email = cleaned.delete(:email)
    unless email.blank?
      user = User.find_by!(email: email)
      cleaned[:user_id] = user.id
    end
    cleaned
  end
end
