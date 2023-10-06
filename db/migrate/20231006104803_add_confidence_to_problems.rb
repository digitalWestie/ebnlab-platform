class AddConfidenceToProblems < ActiveRecord::Migration[7.0]
  def change
    add_column :problems, :confidence, :integer
  end
end
