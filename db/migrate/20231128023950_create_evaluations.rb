class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.integer :score
      t.text :feedback
      t.references :student, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
