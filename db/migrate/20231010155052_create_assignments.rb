class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :assignable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
