class RenameProblemsBodyToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :problems, :body, :description
  end
end
