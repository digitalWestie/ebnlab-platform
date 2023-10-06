class CreatePopulations < ActiveRecord::Migration[7.0]
  def change
    create_table :populations do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :confidence
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
