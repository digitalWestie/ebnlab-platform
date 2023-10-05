class AddEditedByToProblems < ActiveRecord::Migration[7.0]
  def change
    add_reference :problems, :user, null: false, foreign_key: true
  end
end
