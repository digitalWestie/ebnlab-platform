require "test_helper"

class ProblemTest < ActiveSupport::TestCase
  test "can create a valid problem" do
    project = projects(:one)
    problem = Problem.new(project: project, confidence: 1, name: "my problem", description: "it's a big one")
    problem.save()
    assert problem.valid?
  end
end
