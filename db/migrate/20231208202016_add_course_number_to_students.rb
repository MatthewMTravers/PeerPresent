class AddCourseNumberToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :course_number, :string
  end
end
