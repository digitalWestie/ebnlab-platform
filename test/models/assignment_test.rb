require "test_helper"

class AssignmentTest < ActiveSupport::TestCase

  test "prevent duplicate assignments" do
    project = projects(:one)
    user = users(:one)
    a = Assignment.new(assignable: project, user: user)
    assert_not a.valid?
  end

end
