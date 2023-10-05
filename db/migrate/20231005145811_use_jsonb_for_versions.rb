class UseJsonbForVersions < ActiveRecord::Migration[7.0]
  def change
    remove_column :versions, :object, :old_object
    add_column :versions, :object, :jsonb
  end
end
