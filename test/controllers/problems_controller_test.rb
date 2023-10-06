require "test_helper"

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @problem = problems(:one)
    @project = @problem.project
  end

  test "should get index" do
    get project_problems_url(@project)
    assert_response :success
  end

  test "should get new" do
    get new_project_problem_url(@project, @problem)
    assert_response :success
  end

  test "should create problem" do
    assert_difference("Problem.count") do
      post project_problems_url(@project), params: { problem: { confidence: 3, description: "a description", name: "a name" } }
    end

    assert_redirected_to project_problem_url(@project, Problem.last)
  end

  test "should show problem" do
    get project_problem_url(@project, @problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_problem_url(@project, @problem)
    assert_response :success
  end

  test "should update problem" do
    patch project_problem_url(@project, @problem), params: { problem: { confidence: 2, description: @problem.description, name: @problem.name } }
    assert_redirected_to project_problem_url(@project, @problem)
  end

  test "should destroy problem" do
    assert_difference("Problem.count", -1) do
      delete project_problem_url(@project, @problem)
    end

    assert_redirected_to project_problems_url(@project)
  end
end
