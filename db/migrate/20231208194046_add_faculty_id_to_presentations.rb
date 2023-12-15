class AddFacultyIdToPresentations < ActiveRecord::Migration[7.1]
  def change
    add_column :presentations, :faculty_id, :integer
  end
end
