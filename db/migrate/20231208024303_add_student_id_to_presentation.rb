class AddStudentIdToPresentation < ActiveRecord::Migration[7.1]
  def change
    add_column :presentations, :student_id, :integer
  end
end
