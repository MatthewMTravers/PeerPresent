class AddPresentationIdToPresentations < ActiveRecord::Migration[7.1]
  def change
    add_column :presentations, :presentation_id, :integer
    add_index :presentations, :presentation_id
  end
end
