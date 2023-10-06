class AddProjectToProblems < ActiveRecord::Migration[7.0]
  def change
    add_reference :problems, :project, null: false, foreign_key: true
  end
end
