class RemoveFacultyFromPresentations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :presentations, :faculty, null: false, foreign_key: true
  end
end
