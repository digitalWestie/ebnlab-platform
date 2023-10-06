class RenameProjectScopeToScopeDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :scope, :scope_description
  end
end
