class RemoveEditByFromProblems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :problems, :user, null: false, foreign_key: true
  end
end
