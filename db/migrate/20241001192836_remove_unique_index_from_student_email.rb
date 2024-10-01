class RemoveUniqueIndexFromStudentEmail < ActiveRecord::Migration[7.1]
  def change
    remove_index :students, :student_email, if_exists: true
  end
end
