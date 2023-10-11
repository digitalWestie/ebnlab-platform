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
      redirect_to appropriate_assignable_path(@assignment.assignable), notice: 'Team member was successfully assigned.'
    else
      render :new
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to appropriate_assignable_path(@assignment.assignable), notice: 'Team member was removed.'
  end

  def rerole
    @assignment = Assignment.find(params[:id])
    role = @assignment.next_role
    if @assignment.update(role: role)
      redirect_to appropriate_assignable_path(@assignment.assignable), notice: "Role changed to #{role}"
    else
      msg = @assignment.errors.present? ? @assignment.errors.full_messages[0] : ""
      redirect_to appropriate_assignable_path(@assignment.assignable), notice: "Role couldn\'t be changed. #{msg}"
    end
  end

  private

  def appropriate_assignable_path(assignable)
    if assignable.is_a? Organisation
      organisation_path(assignable)
    else
      organisation_project_path(assignable.organisation, assignable)
    end
  end

  def set_assignable
    if params[:project_id]
      @assignable = Project.find(params[:project_id])
    elsif params[:organisation_id]
      @assignable = Organisation.find(params[:organisation_id])
    else
      raise ActiveRecord::RecordNotFound, "No valid assignable type found."
    end
  end

  def assignment_params
    cleaned = params.require(:assignment).permit(:user_id, :email, :assignable_type, :assignable_id)
    email = cleaned.delete(:email)
    unless email.blank?
      user = User.find_by(email: email)
      cleaned[:user_id] = user.try(:id)
    end
    cleaned
  end
end
