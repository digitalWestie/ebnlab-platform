require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can be assigned to a new project" do
    project = projects(:two)
    user = users(:one)
    projects_count = user.projects.count
    user.projects << project
    assert (projects_count+1 == user.projects.count)
  end
end
