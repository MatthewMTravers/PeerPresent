class CreatePresentations < ActiveRecord::Migration[7.1]
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :content
      t.time :date

      t.timestamps
    end
  end
end
