class CreateEvidenceLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :evidence_links do |t|
      t.references :evidenceable, polymorphic: true, null: false
      t.references :evidence_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
