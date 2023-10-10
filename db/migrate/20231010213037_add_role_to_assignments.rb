class AddRoleToAssignments < ActiveRecord::Migration[7.0]
  def change
    add_column :assignments, :role, :string, default: 'collaborator'
  end
end
