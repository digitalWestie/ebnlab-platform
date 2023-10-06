class CreateEvidenceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :evidence_items do |t|
      t.string :name
      t.text :highlight
      t.text :relevance
      t.string :link

      t.timestamps
    end
  end
end
