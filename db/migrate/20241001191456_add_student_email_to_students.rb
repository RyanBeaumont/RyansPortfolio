class AddStudentEmailToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :student_email, :string
  end
end
