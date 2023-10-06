require "application_system_test_case"

class ProblemsTest < ApplicationSystemTestCase
  setup do
    @problem = problems(:one)
    @project = @problem.project
  end

  test "visiting the index" do
    visit project_problems_url(@project)
    assert_selector "h1", text: "Problems"
  end

  test "should create problem" do
    visit project_problems_url(@project)
    click_on "New problem"

    fill_in "description", with: @problem.description
    fill_in "Name", with: @problem.name
    click_on "Create Problem"

    assert_text "Problem was successfully created"
    click_on "Back"
  end

  test "should update Problem" do
    visit project_problem_url(@project, @problem)
    click_on "Edit this problem", match: :first

    fill_in "description", with: @problem.description
    fill_in "Name", with: @problem.name
    click_on "Update Problem"

    assert_text "Problem was successfully updated"
    click_on "Back"
  end

  test "should destroy Problem" do
    visit project_problem_url(@project, @problem)
    click_on "Destroy this problem", match: :first

    assert_text "Problem was successfully destroyed"
  end
end
